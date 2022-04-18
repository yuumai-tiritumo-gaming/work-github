class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :quantity, comparison: { greater_than: 0 }
end
