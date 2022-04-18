class Order < ApplicationRecord
  validates :postal_code, length: { is: 7 }
end
