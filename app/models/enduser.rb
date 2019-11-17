class Enduser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_paranoid
  has_many :contacts, dependent: :destroy
  has_many :adresses
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders
  has_one :cart

  

end
