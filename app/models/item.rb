class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  has_one_attached :item_image
  
  def add_tax_price
    (self.non_tax_price * 1.08).round
  end

end
