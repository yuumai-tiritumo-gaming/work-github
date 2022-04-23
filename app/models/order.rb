class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items, dependent: :destroy
  enum trade_status: { waiting: 0, confirmed: 1, making: 2, preparing: 3, shipped: 4 }
  enum payment_method: { credit_card: 0, transfer: 1 }
  validates :postal_code, length: { is: 7 }
end
