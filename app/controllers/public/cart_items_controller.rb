class Public::CartItemsController < ApplicationController
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to action: "index"
    else
      @genres = Genre.all
      @item = Item.find(@cart_item.item_id)
      render "public/items/show"
    end
  end
  
  def index
    @cart_items =  current_customer.cart_items
  end

  

  def clear
    current_customer.cart_items.destroy_all
    @cart_items =  current_customer.cart_items
    respond_to do |format|
     format.html { redirect_to request.referer }
     format.js   { render "public/cart_items/update.js.erb" }
    end
  end

  def destroy
    CartItem.find(params[:id]).destroy
    @cart_items =  current_customer.cart_items
    respond_to do |format|
     format.html { redirect_to request.referer }
     format.js   { render "public/cart_items/update.js.erb" }
    end
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

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end

end
