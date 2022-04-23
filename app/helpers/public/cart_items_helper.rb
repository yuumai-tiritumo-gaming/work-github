module Public::CartItemsHelper

  #税込表示
  def with_tax_price(price)
    @tax_in = (price*1.1).floor.to_s(:delimited)
  end

  #小計表示
  def subtotal(quantity)
    ((@tax_in.to_i)*quantity).floor.to_s(:delimited)
  end

  #合計表示
  def total_price(cart_item_all)
    @price = 0
    cart_item_all.each do |cart_items|
      items  = Item.find(cart_items.item_id)
      tax_in = ((items.non_tax_price)*1.1).floor
      num    = (tax_in*(cart_items.quantity)).floor
      @price += num
    end
    @price.to_s(:delimited)
  end

   def total_price_undelimited(cart_item_all)
    @price = 0
    cart_item_all.each do |cart_items|
      items  = Item.find(cart_items.item_id)
      tax_in = ((items.non_tax_price)*1.1).floor
      num    = (tax_in*(cart_items.quantity)).floor
      @price += num
    end
    @price
   end

end
