class Publics::OrdersController < Publics::ApplicationController
  def index
  	
  end

  def new
  	@enduser = Enduser.where(id: current_enduser.id)
  	@order = Order.new

  end

  def create
    @order = Order.new(order_params)
    @order.enduser_id = current_enduser.id
    @order.save
    redirect_to orders_complete_path
  end

  def complete
  end

private
  def order_params
    params.require(:order).permit(:enduser_id, :address_id, :payment, :total_price, :status, :created_at, :updated_at)
  end

end
