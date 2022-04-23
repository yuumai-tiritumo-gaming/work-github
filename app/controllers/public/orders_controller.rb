class Public::OrdersController < ApplicationController
  def show
          @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def index
    @orders = current_customer.orders
  end

  def new
      @order = Order.new
    @address = Address.new
    # 中央揃えと=揃えどっちが見やすいかな
  end

  def check
    @order = Order.new(order_params)
    if    params[:address_info] == 0
      @order.postal_code =    current_customer.postal_code
      @order.address     =    current_customer.address
      @order.name        = "#{current_customer.family_name}" + "#{current_customer.first_name}"
    elsif params[:address_info] == 1
      @order.postal_code =    Address.find(params[:id]).postal_code
      @order.address     =    Address.find(params[:id]).address
      @order.name        = "#{Address.find(params[:id]).first_name}" + "#{Address.find(params[:id]).family_name}"
    else #params[:address_info] == 2
      @order.postal_code = params[:postal_code]
      @order.address     = params[:address]
      @order.name        = params[:name]
      # まとめて書ける？@order = params[:postal_code,:address,:name]
    end
    @cart_items = @order.customer.cart_items
  end

  def create
    order = Order.create(order_conform_params)
    order.customer.cart_items.each do |cart_items|
      item = Item.find(cart_items.item_id)
      OrderItem.create(order_id: order.id,
                        item_id: item.id,
                          price: item.price,
                       quantity: cart_items.quantity)
    end
    # これcreate View作ればいいんじゃないの？
    current_customer.cart_items.destroy_all
    redirect_to action: "conform"
  end

  def conform
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :trade_status, :total_payment, :postage)
    # :postal_code, :address, :name, は一時的に排除
  end
  def order_conform_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :trade_status, :total_payment, :postage)
  end

end
