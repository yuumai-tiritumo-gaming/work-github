module Public::OrdersHelper

  def total_order_quantity(order_item_all)
    @quantity = 0

    order_item_all.each do |order_items|
      @quantity += order_items.quantity
    end
    @quantity
  end

end
