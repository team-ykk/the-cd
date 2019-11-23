class Publics::ReviewsController < ApplicationController

	def create
		@item = Item.find(params[:item_id])
		@review = current_enduser.reviews.new(review_params)
		@review.item_id = @item.id
		@review.enduser_id = current_enduser.id
		@review.save
		redirect_to item_path(@item.id)
	end

private
  def review_params
        params.require(:review).permit(:review_content, :enduser_id, :item_id)
  end
end
