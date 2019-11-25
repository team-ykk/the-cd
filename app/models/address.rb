class Address < ApplicationRecord
	belongs_to :enduser
	has_many :orders
	validates :name, presence: true
	validates :postcode, presence: true
	validates :prefecture_id, presence: true
	validates :address, presence: true
	validates :phone_number, presence: true
end
