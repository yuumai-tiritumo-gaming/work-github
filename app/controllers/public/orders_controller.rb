class Public::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def index
    @orders = current_customer.orders
  end

  def new
    @order   = Order.new
    @address = Address.new
  end

  def check
    @order = Order.new(order_params)
    if    params[:address_info] == 0
      @order.postal_code = 
      @order.address     = current_customer.address
      @order.name        = "#{current_customer.family_name}" + "#{current_customer.first_name}"
      
    elsif params[:address_info] == 1

    else #params[:address_info] == 2

    end
  end

  def create
    Order.new(order_params).save
    redirect_to action: "conform"
  end

  def conform
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :trade_status, :total_payment, :postage)
    # :postal_code, :address, :name, は一時的に排除
  end

end
