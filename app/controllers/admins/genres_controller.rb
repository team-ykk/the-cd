class Admins::GenresController < Admins::ApplicationController
  def new
  	@genre = Genre.new
  end

  def create
    @back_url = session[:my_previous_url]
  	@genre = Genre.new(genre_params)
  	if @genre.save
  	 redirect_to @back_url
    else
      render :new
    end
  end
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
