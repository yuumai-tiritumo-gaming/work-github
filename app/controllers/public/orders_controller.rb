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
  end

  def check
    @order = Order.new(order_params)
  end

  def create
    @order = Order.new(order_params).save
    redirect_to action: "conform"
  end

  def conform
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :trade_status, :total_payment, :postage)
  end

end
