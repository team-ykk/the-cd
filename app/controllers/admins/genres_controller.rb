class Admins::GenresController < Admins::ApplicationController
  def new
  	@genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)
  	@genre.save
  	redirect_to new_admins_item_path
  end
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
