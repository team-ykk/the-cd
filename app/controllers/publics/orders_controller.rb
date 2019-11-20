class Publics::OrdersController < Publics::ApplicationController
  def index
  	
  end

  def new
  	@enduser = Enduser.where(id: current_enduser.id)
  	@order = Order.new
  end

  def create
  end

  def complete
  end
end
