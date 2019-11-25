class Item < ApplicationRecord
	acts_as_paranoid
	has_many :add_items
	has_many :favorites, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :discs
	belongs_to :genre
    belongs_to :label
    belongs_to :artist
    has_many :cart_items
    has_many :carts, through: :cart_items, dependent: :destroy
    attachment :item_profile
    accepts_nested_attributes_for :discs, allow_destroy: true

    validates :item_name, presence:true
    validates :shipdate, presence:true
    validates :price, presence:true
    validates :stock, presence:true
    validates :status, presence:true
    validates :genre_id, presence:true
    validates :label_id, presence:true
    validates :artist_id, presence:true

    enum status: { 販売中: true, 販売停止中: false }

    def favorited_by?(enduser)
        favorites.where(enduser_id: enduser.id).exists?
    end

    def self.search(search)
        if search
            Item.where(['item_name LIKE ?', "%#{search}%"])
        else
            Item.all
        end
    end
    end