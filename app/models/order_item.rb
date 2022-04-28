class OrderItem < ApplicationRecord

  belongs_to :item
  belongs_to :order
  enum making_status: { impossible: 0, waiting: 1, making: 2, finished: 3 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
