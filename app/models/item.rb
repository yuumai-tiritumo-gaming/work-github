class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  has_one_attached :item_image

end
