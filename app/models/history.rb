class History < ApplicationRecord
	belongs_to :order
	attachment :item_profile
end
