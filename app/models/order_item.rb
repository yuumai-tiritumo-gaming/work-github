class OrderItem < ApplicationRecord

  belongs_to :item
  belongs_to :order

  validates :quantity, comparison: { greater_than: 0 }
end
