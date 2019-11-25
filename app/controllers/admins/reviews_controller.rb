class Admins::ReviewsController < Admins::ApplicationController
  def edit
  end

  def update
  end

  def destroy
    @item = Item.find(params[:item_id])
    @review = @item.reviews.find(params[:id])
    @review.destroy
    redirect_to admins_item_path(@item)
  end
end
