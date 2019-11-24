class Additem < ApplicationRecord
	belongs_to :item

    validates :add_item, presence:true
    validates :item_id, presence:true

    def alladd
    	return Item.with_deleted.find_by(id: item_id)
    end
end
