module Public::CartItemsHelper

  def with_tax_price(price)
    @tax_in = (price*1.1).floor.to_s(:delimited)
  end

  def subtotal(quantity)
    ((@tax_in.to_i)*quantity).floor.to_s(:delimited)
  end
  

end
