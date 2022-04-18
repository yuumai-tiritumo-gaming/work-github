class Address < ApplicationRecord
  validates :postal_code, length: { is: 7 }
end
