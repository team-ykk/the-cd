class Publics::ItemsController < Publics::ApplicationController

  def index
   @item = Item.new
   @items = Item.search(params[:search])
   @items = @items.page(params[:page]).order(shipdate: "DESC")
   @tax = Tax.find(1)
  end

  def show
    if enduser_signed_in?
      @cart = current_enduser.cart
      @cart_in = @cart.cart_items
      @item = Item.find(params[:id])
    else
    end
      @tax = Tax.find(1)
      @cart_item = CartItem.new
      @review = Review.new
      @reviews = Review.all
  end

  def ranking
     @item = Item.new
     @tax = Tax.find(1)
     @items = Item.search(params[:search])
     @items = Item.find(Favorite.group(:item_id).order('count(item_id) desc').pluck(:item_id))

  end
  private
  def item_params
        params.require(:item).permit(:item_name, :shipdate, :price, :stock, :status, :item_profile, :deleted_at)
  end
end