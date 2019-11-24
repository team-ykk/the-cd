class Admins::ItemsController < Admins::ApplicationController
  def index
    @item = Item.new
    @items = Item.search(params[:search]).order("shipdate DESC").page(params[:page])
    @tax = Tax.find(1)
  end

  def new
    @item = Item.new
    @disc = @item.discs.build
    @song = @disc.songs.build
  end

  def show
    @item = Item.with_deleted.find(params[:id])
    @tax = Tax.find(1)
  end

  def restore
    @item = Item.with_deleted.find(params[:id])
    @item.restore
    redirect_to admins_item_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_items_path
    else
      render :new
    end
  end

  def update
    @item = Item.with_deleted.find(params[:id])
    if  @item.deleted_at == nil
      if @item.update(item_params)
        redirect_to admins_item_path(@item)
      else
        render :edit
      end
    else
      @item.restore
      redirect_to admins_item_path(@item)
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admins_items_path
  end

  def ranking
  end
  private
  def item_params
    params.require(:item).permit(:item_name, :shipdate, :price, :stock, :status, :item_profile,
     :genre_id, :label_id, :artist_id, discs_attributes: [:id, :disc_name, :_destroy,
      songs_attributes:[:id, :song_name, :song_number, :_destroy]])
  end
end
