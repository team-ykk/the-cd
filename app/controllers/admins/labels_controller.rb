class Admins::LabelsController < Admins::ApplicationController
  def new
  	@label = Label.new
  end

  def create
    @back_url = session[:my_previous_url]
  	@label = Label.new(label_params)
  	if @label.save
  	 redirect_to @back_url
    else
      render :new
    end
  end
  def label_params
    params.require(:label).permit(:label_name)
  end
end
