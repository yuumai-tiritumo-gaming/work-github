class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  has_one_attached :item_image

  validates :name, presence: true
  validates :body, presence: true
  #validates :item_image, presence: true
  validates :genre_id, presence: true
  validates :non_tax_price, presence: true
  validates :is_selling, presence: true

  #def add_tax_price
    #(self.non_tax_price * 1.08).round
  #end

end
