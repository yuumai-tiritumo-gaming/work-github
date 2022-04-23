class Address < ApplicationRecord
  belongs_to :customer
  validates :postal_code, length: { is: 7 }

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  def view_address_info
    "〒" + self.postal_code + "   " + self.address + "   " + self.name
    # ここどうするか？
  end

end
