class Admins::LabelsController < Admins::ApplicationController
  def new
  	@label = Label.new
  end

  def create
  	@label = Label.new(label_params)
  	@label.save
  	redirect_to new_admins_item_path
  end
  def label_params
    params.require(:label).permit(:label_name)
  end
end
