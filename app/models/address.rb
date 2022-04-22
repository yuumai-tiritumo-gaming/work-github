class Address < ApplicationRecord
  belongs_to :customer
  validates :postal_code, length: { is: 7 }

  def view_address_info
    "〒" + self.postal_code + "   " + self.address + "   " + self.name
  end

end
