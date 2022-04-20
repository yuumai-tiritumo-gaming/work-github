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
  end
end
