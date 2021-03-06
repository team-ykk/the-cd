class Admins::AdditemsController < Admins::ApplicationController
  def new
  	@items = Item.search(params[:search]).order("id").page(params[:page])
  	@additem = Additem.new
  	render :new
  end
  def index
    @additems = Additem.all.order("created_at DESC").page(params[:page])
  end

  def create
    @items = Item.search(params[:search]).order("id").page(params[:page])
    @item = @items.page(params[:page])
  	@additem = Additem.new(additem_params)
  	if @additem.save
    	@item = Item.find(@additem.item_id)
    	@item_stock = @additem.add_item + @item.stock
    	@item.update(stock:@item_stock)
    	redirect_to admins_additems_path
    else
      render :new
    end
  end
  private
  def additem_params
  	params.require(:additem).permit(:add_item, :item_id)
  end
end
