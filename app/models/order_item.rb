class OrderItem < ApplicationRecord
  validates :quantity, comparison: { greater_than: 0 }
end
