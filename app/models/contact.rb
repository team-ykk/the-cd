class Contact < ApplicationRecord
	belongs_to :enduser
	has_one :contact_reply
	validates :contact_content, presence: true

	def alladd
		return Enduser.with_deleted.find_by(id: enduser_id)
	end
end
