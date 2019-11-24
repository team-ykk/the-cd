class Label < ApplicationRecord
	has_many :items

    validates :label_name, presence:true, uniqueness: true
end
