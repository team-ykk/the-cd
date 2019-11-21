class Admins::GenresController < Admins::ApplicationController
  def new
  	@genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  	 redirect_to new_admins_item_path
    else
      render :new
    end
  end
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
