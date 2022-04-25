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
  validates :is_selling, inclusion: {in: [true, false]}

  def get_item_image(width,height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
      item_image.variant(resize_to_limit: [width, height]).processed
  end

end
