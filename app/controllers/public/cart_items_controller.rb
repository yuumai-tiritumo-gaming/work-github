class Public::CartItemsController < ApplicationController

  def index
    @cart_items =  current_customer.cart_items
  end

  def create
  end

  def clear
    current_user.cart_items.destroy_all
    redirect_to request.referer
  end

  def destroy
  end

  def update
  end
end
