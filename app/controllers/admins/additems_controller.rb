class Admins::AdditemsController < Admins::ApplicationController
  def new
  	@items = Item.search(params[:search])
  	@item = @items.page(params[:page])
  	@additem = Additem.new
  	render :new
  end
  def index
  end



  def create
  	@additem = Additem.new(additem_params)
  	@additem.save
  	@item = Item.find(@additem.item_id)
  	@item_stock = @additem.add_item + @item.stock
  	@item.update(stock:@item_stock)
  	@item.save
  	redirect_to admins_additems_path
  end
  private
  def additem_params
  	params.require(:additem).permit(:add_item, :item_id)
  end
end
