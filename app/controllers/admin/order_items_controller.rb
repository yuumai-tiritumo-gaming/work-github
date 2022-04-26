class Admin::OrderItemsController < ApplicationController
  before_action :valid_admin?
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(making_status: params[:making_status].to_i)
    redirect_to request.referer
  end
end
