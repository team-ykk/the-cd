class Order < ApplicationRecord
	belongs_to :enduser
	belongs_to :address
	has_many :histories, dependent: :destroy
	enum payment: [['銀行振込',1], ['クレジットカード',2], ['代引き',3]]
end
