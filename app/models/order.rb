class Order < ApplicationRecord
	belongs_to :enduser
	belongs_to :address
	has_many :histories, dependent: :destroy
end
