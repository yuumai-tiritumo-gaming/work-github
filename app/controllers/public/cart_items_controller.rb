class Public::CartItemsController < ApplicationController
  before_action :valid_customer?, only: [:create]

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to action: "index"
    else
      if customer_signed_in?
        flash[:alert] = "カート一覧から修正してください"
      else
        flash[:alert] = "商品購入には会員登録またはログインが必要です"
      end
      redirect_to request.referer
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

  def valid_customer?
    unless customer_signed_in?
      redirect_to new_customer_session_path
    end
  end

end
