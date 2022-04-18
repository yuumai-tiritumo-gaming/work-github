class CartItem < ApplicationRecord
  validates :quantity, comparison: { greater_than: 0 }
end
