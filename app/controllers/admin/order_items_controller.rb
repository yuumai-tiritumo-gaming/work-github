class Admin::OrderItemsController < ApplicationController
  before_action :valid_admin?

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(making_status: params[:making_status].to_i)
    if params[:making_status] == "2"
      @order_item.order.update(trade_status: 2 )
    elsif params[:making_status] == "3" && @order_item.order.order_items.all? {|order_item| order_item.making_status == OrderItem.making_statuses.key(3)}
      @order_item.order.update(trade_status: 3 )
    end
    redirect_to request.referer
  end

end
