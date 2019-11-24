class Admins::ArtistsController < Admins::ApplicationController
  def new
  	@artist = Artist.new
    @artists = Artist.all
  end

  def create
    @artists = Artist.all
    @back_url = session[:my_previous_url]
  	@artist = Artist.new(artist_params)
    if	@artist.save
      redirect_to @back_url
    else
      render :new
    end
  end
  private
  def artist_params
    params.require(:artist).permit(:artist_name)
  end
end
