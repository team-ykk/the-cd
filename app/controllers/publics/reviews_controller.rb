class Publics::ReviewsController < ApplicationController

	def create
		@item = Item.find(params[:item_id])
		@review = current_enduser.reviews.new(review_params)
		@review.item_id = @item.id
		@review.enduser_id = current_enduser.id
		@tax = Tax.find(1)
		@cart_item = CartItem.new
		@cart = current_enduser.cart
		@cart_in = @cart.cart_items
		@reviews = Review.all
		if @review.save
			redirect_to item_path(@item.id)
	    else
	    	flash[:notblank] = '空白で投稿はできません'
			redirect_to item_path(@item.id)
	    end
	end

private
  def review_params
        params.require(:review).permit(:review_content, :enduser_id, :item_id)
  end
end
