class Admin::OrdersController < ApplicationController
  def show
  end

  def index
    @orders = Order.order("created_at DESC").page(params[:page])
    @customer = Customer.find(order.customer_id)
    @order_items = @customer.order_items
  end

  def update
  end
end
