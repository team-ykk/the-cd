class Admins::OrdersController < Admins::ApplicationController
  def index
  	@orders = Order.page(params[:page]).reverse_order
  end

  def edit
  	@order = Order.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])
  	@order.update
  	redirect_to admins_orders_path
  end

  private
  def order_params
    params.require(:order).permit(:enduser_id, :address_id, :payment, :total_price, :status)
  end
end
