class Address < ApplicationRecord
	belongs_to :enduser
	has_many :orders
end
