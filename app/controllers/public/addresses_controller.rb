class Public::AddressesController < ApplicationController
  def index
    @customer = current_customer
    @addresses = @customer.addresses
    @address = Address.new
  end

  def create
    Address.new(address_params).save
    redirect_to request.referer
  end

  def destroy
    Address.find(params[:id]).destroy
    redirect_to request.referer
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.customer != current_customer
      redirect_to public_mypage_path
    elsif
      @address.update(address_params)
      redirect_to public_addresses_path, notice: "会員情報を更新しました"
    else
      render "edit"
    end
  end

  private
    def address_params
      params.require(:address).permit(:customer_id, :postal_code, :address, :name)
    end
end
