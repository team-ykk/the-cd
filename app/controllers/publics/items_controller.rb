class Publics::ItemsController < Publics::ApplicationController

  def index
  	@items = Item.page(params[:page]).reverse_order
  end

  def show
  	@item = Item.find(params[:id])
  end

  def ranking
  end

  private
  def item_params
        params.require(:item).permit(:item_name, :shipdate, :price, :stock, :status, :item_profile, :deleted_at)
  end


end