module Public::OrdersHelper
  
  
  
  #合計注文個数表示
  def total_order_quantity(order_item_all)
    @quantity = 0
  
    order_item_all.each do |order_items|
      @quantity += quantity  
    end
    @quantity
  end
  
end
