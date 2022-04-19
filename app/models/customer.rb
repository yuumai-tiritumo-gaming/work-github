class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses,  dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders,     dependent: :destroy


  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
  validates :family_kana, format: { with: KATAKANA_REGEXP }
  validates :first_kana, format: { with: KATAKANA_REGEXP }


  validates :postal_code, length: { is: 7 }
  
  def active_for_authentication?
    super && (self.is_active == true)
  end
end
