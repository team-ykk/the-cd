class Order < ApplicationRecord
	belongs_to :enduser
	belongs_to :address
	has_many :histories, dependent: :destroy
	enum payment: { aaa: 1, iii: 2, uuu: 3 }
	enum status: { 受付中: 1, 商品準備中: 2, 出荷済: 3}
	validates :address_id, presence:true
	validates :payment, presence:true
	

	def alladd
		return Enduser.with_deleted.find_by(id: enduser_id)
	end
end
