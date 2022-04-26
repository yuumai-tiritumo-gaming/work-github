class Public::OrdersController < ApplicationController
  before_action :valid_cart?, only: [:new]
  before_action :your_address?, only: [:show]

  def show
    @order       = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def index
    @orders = current_customer.orders
  end

  def new
      @order     = Order.new
      @addresses = current_customer.addresses
    # 中央揃えと=揃えどっちが見やすいかな
  end

  def check
    if    params[:order][:address_info] == "0"
      @order = Order.new(order_params)
      @order.postal_code =    current_customer.postal_code
      @order.address     =    current_customer.address
      @order.name        = "#{current_customer.family_name}" + "#{current_customer.first_name}"
    elsif params[:order][:address_info] == "1"
      @order = Order.new(order_params)
      @order.postal_code =    Address.find(params[:order][:address_id]).postal_code
      @order.address     =    Address.find(params[:order][:address_id]).address
      @order.name        =    Address.find(params[:order][:address_id]).name
    else #params[:order][:address_info] == "2"
      @order = Order.new(order_params)
      if params[:order][:postal_code].empty? && params[:order][:address].empty? && params[:order][:name].empty?
        @addresses = current_customer.addresses
        flash.now[:alert] = "宛先を入力してください"
        render "new"
      else
        @order.postal_code = params[:order][:postal_code]
        @order.address     = params[:order][:address]
        @order.name        = params[:order][:name]
      end
      # params[:order][:hoge]とparams[:hoge]の違いを説明できないけど、params[:hoge]はnilだった
      # まとめて書ける？@order = params[:postal_code,:address,:name]
    end
    @cart_items = current_customer.cart_items
  end

  def create
    order = Order.create(order_params)
    order.customer.cart_items.each do |cart_items|
      item = Item.find(cart_items.item_id)
      OrderItem.create(order_id: order.id,
                        item_id: item.id,
                          price: item.non_tax_price,
                       quantity: cart_items.quantity)
    end
    # これcreate View作ればいいんじゃないの？
    current_customer.cart_items.destroy_all
    redirect_to public_orders_conform_path
  end

  def conform
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :trade_status, :total_payment, :postage, :postal_code, :address, :name)
  end

  def valid_cart?
    unless current_customer.cart_items.exists?
      redirect_to public_root_path
    end
  end

  def your_address?
    unless Address.find(params[:id]).customer == current_customer
      redirect_to public_root_path
    end
  end

end
