class Contact < ApplicationRecord
	belongs_to :enduser
	has_one :contact_reply
	validates :contact_content, presence: true
end
