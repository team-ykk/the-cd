class Admins::ReviewsController < Admins::ApplicationController
  def edit
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id])
  end

  def update
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id])
      if @review.update(review_params)
         flash[:notice] = "successfully"
         redirect_to admins_item_path(@item)
      else
        render action: :edit
      end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @review = @item.reviews.find(params[:id])
    @review.destroy
    redirect_to admins_item_path(@item)
  end

  private
  def review_params
      params.require(:review).permit(:review_content, :enduser_id, :item_id)
  end
end
