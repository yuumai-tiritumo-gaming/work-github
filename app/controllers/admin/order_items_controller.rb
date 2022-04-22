class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(making_status: params[:making_status].to_i)
    @order = Order.find(params[:id])
    redirect_to admin_order_path(@order)
  end
end
