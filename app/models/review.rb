class Review < ApplicationRecord
	belongs_to :enduser
	belongs_to :item

	validates :review_content, presence:true
	validates :review_content, length: {maximum: 200}
end
