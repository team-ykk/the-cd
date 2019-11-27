class Enduser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_paranoid
  has_many :contacts
  has_many :addresses
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders
  has_one :cart

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :postcode, presence: true
  validates :prefecture, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :first_name, length: { maximum: 20 }
  validates :last_name, length: { maximum: 20 }
end
