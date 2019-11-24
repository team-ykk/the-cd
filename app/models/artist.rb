class Artist < ApplicationRecord
	has_many :items

    validates :artist_name, presence:true, uniqueness: true
end
