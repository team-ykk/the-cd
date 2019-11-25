class Publics::AddressesController < Publics::ApplicationController
  def new
  	@address = Address.new
  end

  def index
  end

  def create
  	@address = Address.new(addresses_params)
    @address.enduser_id = current_enduser.id
  	if @address.save
  	 redirect_to new_order_path
    else
      render :new
      #self.new
      #render new_address_path
      #render action: :new
      #render template: "new"
      #render "publics/addresses/new"
    end
  end

  def addresses_params
  	params.require(:address).permit(:name,:postcode,:prefecture_id,:address,:phone_number)
  end
end
