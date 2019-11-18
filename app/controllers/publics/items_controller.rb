class Publics::ItemsController < Publics::ApplicationController

  def index
   @item = Item.new
   @items = Item.search(params[:search])
   @tax = 1.1

  end

  def show
  	@item = Item.find(params[:id])
    @tax = 1.1
  end

  def ranking
  end

  private
  def item_params
        params.require(:item).permit(:item_name, :shipdate, :price, :stock, :status, :item_profile, :deleted_at)
  end


end