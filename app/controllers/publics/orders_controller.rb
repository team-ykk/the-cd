class Publics::OrdersController < Publics::ApplicationController
  
  #購入履歴画面にもデータを保存させる
  #↓
  #カートを空にする機能を作る
  def index
  	
  end

  def new
  	@enduser = Enduser.where(id: current_enduser.id)#ここでエラーが起こったら、ログインする
  	@order = Order.new

  end

  def create
    @order = Order.new(order_params)
    @order.enduser_id = current_enduser.id
    @order.save

    

    @history = History.new
    @history.order_id = current_order.id
    #@history.item_name = items.item_name
    #@history.artist_name = artists.artist_name
    #@history.quantity = cart_items.quantity
    #@history.subtotal = cart_items.subtotal
    #@history.item_profile_id = items.item_profile_id
    @history.save
    


    redirect_to orders_complete_path
  end

  def complete
  end

private
  def order_params
    params.require(:order).permit(:enduser_id, :address_id, :payment, :total_price, :status, :created_at, :updated_at)
  end

end
