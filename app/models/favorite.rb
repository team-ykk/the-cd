class Favorite < ApplicationRecord
	belongs_to :enduser
	belongs_to :item
end
