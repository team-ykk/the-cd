class Item < ApplicationRecord
	default_scope -> { order(shipdate: :desc) }
	acts_as_paranoid
	has_many :add_items
	has_many :favorites, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :discs
	belongs_to :genre
    belongs_to :label
    belongs_to :artist
    has_many :cart_items
    has_many :carts, through: :cart_items
    attachment :item_profile
    accepts_nested_attributes_for :discs, allow_destroy: true

    enum status: { sell: 1, sell_stop: 2 }

    def self.search(search)
        if search
            Item.where(['item_name LIKE ?', "%#{search}%"])
        else
            Item.all
        end
    end

end
