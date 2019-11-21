class Order < ApplicationRecord
	belongs_to :enduser
	belongs_to :address
	has_many :histories, dependent: :destroy
	# enum payment: [['銀行振込',1], ['クレジットカード',2], ['代引き',3]]
	enum payment: { aaa: 1, iii: 2, uuu: 3 }
	enum status: { 受付中: 1, 商品準備中: 2, 出荷済: 3}
end
