class Admins::ItemsController < Admins::ApplicationController
  def index
  end

  def new
    @item = Item.new
    @disc = @item.discs.build
    @song = @disc.songs.build
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def ranking
  end
  private
  def item_params
    params.require(:item).permit(:itme_name, :shipdate, :price, :stock, :status, :item_profile,
     :genre_id, :lavel_id, :artist_id, discs_attributes: [:id, :disc_name, :_destroy,
      songs_attributes:[:id, :song_name, :song_number, :_destroy]])
  end
end
