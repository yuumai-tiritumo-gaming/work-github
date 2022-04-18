class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
  validates :family_kana, format: { with: KATAKANA_REGEXP }
  validates :first_kana, format: { with: KATAKANA_REGEXP }

  validates :password, length: { minimum: 6 }
  validates :postal_code, length: { is: 7 }
end
