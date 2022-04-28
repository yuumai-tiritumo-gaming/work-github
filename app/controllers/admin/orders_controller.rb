class Admin::OrdersController < ApplicationController
  before_action :valid_admin?
  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.order("created_at DESC").page(params[:page])

  end

  def update
    @order = Order.find(params[:id])
    @order.update(trade_status: params[:trade_status].to_i)
    if params[:trade_status] == "1"
        @order.order_items.each do |order_item|
        order_item.update(making_status: 1 )
        end
    end
    render :show
  end

end
