class Contact < ApplicationRecord
	belongs_to :enduser
	has_one :contact_reply
end
