class ContactReply < ApplicationRecord
	belongs_to :contact
	validates :reply_content, presence: true, on: :update
end
