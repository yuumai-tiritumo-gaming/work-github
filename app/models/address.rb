class Address < ApplicationRecord
  belongs_to :customer
  validates :postal_code, length: { is: 7 }
end
