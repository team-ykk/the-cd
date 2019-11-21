class Publics::ItemsController < Publics::ApplicationController

  def index
   @item = Item.new
   @items = Item.search(params[:search])
   @items = @items.page(params[:page])
   @tax = Tax.find(1)
  end

  def show
  	@item = Item.find(params[:id])
    @cart = current_enduser.cart
    @tax = Tax.find(1)
    @cart_item = CartItem.new
    @review = Review.new
    @reviews = Review.all
  end

  def ranking
  end

  private
  def item_params
        params.require(:item).permit(:item_name, :shipdate, :price, :stock, :status, :item_profile, :deleted_at)
  end
end