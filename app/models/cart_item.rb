class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :item_id, uniqueness:{ scope: :customer_id }
end