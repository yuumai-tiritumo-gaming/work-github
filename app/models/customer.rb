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

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_kana, presence: true
  validates :first_kana, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true


  def active_for_authentication?
    super && (self.is_active == true)
  end
end
