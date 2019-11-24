class Admins::FreightsController < Admins::ApplicationController
  def index
  	@freight = Freight.find(1)
  end
  def edit
  	@freight = Freight.find(1)
  end

  def update
  	@freight = Freight.find(1)
    @back_url = session[:my_previous_url]
  	if @freight.update(freight_params)
  	 redirect_to admins_freights_path
    else
      render :edit
    end
  end
  private
  def freight_params
  	params.require(:freight).permit(:postage)
  end
end
