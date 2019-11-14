class Review < ApplicationRecord
	belongs_to :enduser
	belongs_to :item
end
