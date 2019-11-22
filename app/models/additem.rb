class Additem < ApplicationRecord
	belongs_to :item

    validates :add_item, presence:true
    validates :item_id, presence:true
end
