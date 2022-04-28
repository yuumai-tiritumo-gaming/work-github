module Public::CartItemsHelper

  def with_tax_price(price)
    @tax_in = (price*1.1).floor
    @tax_in.to_s(:delimited)
  end

  def subtotal(quantity)
    ((@tax_in.to_i)*quantity).floor.to_s(:delimited)
  end

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

  def quantity_hash(cart_item)
    num = 1
    max = (cart_item.quantity.to_i + 21)
    @quantity_hash = { :"#{num}" => num }
    while num < max
      num += 1
      @quantity_hash[:"#{num}"] = num
    end
   @quantity_hash.to_a
  end

end