class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.order("created_at DESC").page(params[:page])
    
  end

  def update
    @order = Order.find(params[:id])
    @order.update(trade_status: params[:trade_status].to_i)
    
    render :show
  end
  
  #private
  #def order_params
    #params.require(:order).permit(:trade_status)
  #end
end
