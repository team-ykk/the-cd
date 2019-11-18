class Publics::AddressesController < Publics::ApplicationController
  def new
  	@address = Address.new
  end

  def create
  	address = Address.new(address_params)
  	address.save
  end
end
