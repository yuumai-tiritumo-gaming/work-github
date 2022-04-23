class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    redirect_to admin_customer_path(@customer), notice: "会員情報を更新しました"
    else
      render "edit"
    end
  end

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  private
  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_kana, :first_kana, :email, :phone_number, :postal_code, :address, :is_active)
  end
end
