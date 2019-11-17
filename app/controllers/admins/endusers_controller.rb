class Admins::EndusersController < Admins::ApplicationController
  def index
      @enduser = Enduser.all
  end

  def show
      @enduser = Enduser.find(params[:id])
  end

  def edit
      @enduser = Enduser.find(params[:id])
      if @enduser.id != current_enduser.id
         redirect_to enduser_path(current_enduser.id)
      end
  end

  def update
      @enduser = Enduser.find(params[:id])
      if @enduser.update(enduser_params)
         flash[:notice] = "successfully"
         redirect_to admins_enduser_path(current_enduser.id)
      else
        render action: :edit
      end
  end

  def destroy
      enduser = Enduser.find(params[:id])
      enduser.destoroy
      redirect_to root_path
  end

  private
  def enduser_paramas
      params.require(:enduser).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postcord, :prefecture, :address, :phone_number, :email)
  end
end