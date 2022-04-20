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
    cart_item = CartItem.find(params[:id])
    cart_item.update(quantity: params[:quantity])
    @cart_items =  current_customer.cart_items
    respond_to do |format|
     format.html { redirect_to request.referer }
     format.js
    end
  end

end
