class Publics::AddressesController < Publics::ApplicationController
  def new
  	@address = Address.new
  end

  def create
  	address = Address.new(addresses_params)
    address.enduser_id = current_enduser.id
  	address.save
  	redirect_to new_order_path
  end

  def addresses_params
  	params.require(:address).permit(:name,:postcode,:prefecture_id,:address,:phone_number)
  end
end
