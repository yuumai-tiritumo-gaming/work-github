class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_mypage_path(@customer), notice: "会員情報を更新しました"
    else
      render "edit"
    end
  end

  def confirmation
  end

  def unsubscribe
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to public_root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_kana, :first_kana, :email, :phone_number, :postal_code, :address)
  end
end
