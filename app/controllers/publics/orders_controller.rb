class Publics::OrdersController < Publics::ApplicationController
  
  #購入履歴画面にもデータを保存させる
  #↓
  #カートを空にする機能を作る
  def index
  	@orders = Order.where(enduser_id: current_enduser.id)
    @tests = ['__','北海道', '青森県', '岩手県', '宮城県', '秋田県', '山形県', '福島県', '茨城県', '栃木県', '群馬県', '埼玉県', '千葉県', '東京都', '神奈川県', '新潟県', '富山県', '石川県', '福井県', '山梨県', '長野県', '岐阜県', '静岡県', '愛知県', '三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県', '鳥取県', '島根県', '広島県', '山口県', '徳島県', '香川県', '愛媛県', '高知県', '福岡県', '佐賀県', '長崎県', '熊本県', '大分県', '宮崎県', '鹿児島県', '沖縄県']
  end

  def new
  	#@enduser = Enduser.where(id: current_enduser.id)#ここでエラーが起こったら、ログインする
  	@order = Order.new
    @history = History.new
    @item = Item.new

    
    @tests = ['__','北海道', '青森県', '岩手県', '宮城県', '秋田県', '山形県', '福島県', '茨城県', '栃木県', '群馬県', '埼玉県', '千葉県', '東京都', '神奈川県', '新潟県', '富山県', '石川県', '福井県', '山梨県', '長野県', '岐阜県', '静岡県', '愛知県', '三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県', '鳥取県', '島根県', '広島県', '山口県', '徳島県', '香川県', '愛媛県', '高知県', '福岡県', '佐賀県', '長崎県', '熊本県', '大分県', '宮崎県', '鹿児島県', '沖縄県']

    @cart = current_enduser.cart
    @cart_items = CartItem.where(cart_id: @cart.id)
    @cart_total_price = 0
    @cart_items.each do |i|
      @cart_total_price += i.subtotal
    end
    @freight = Freight.find(1)
    @order.total_price = @cart_total_price
  end

  def create
    judge = "買える"
    @freight = Freight.find(1)

    order = Order.new(order_params)
    order.enduser_id = current_enduser.id
    cart = current_enduser.cart
    cart_items = CartItem.where(cart_id: cart.id)
    cart_total_price = 0
    cart_items.each do |i|
      cart_total_price += i.subtotal
    end
    order.total_price = cart_total_price+@freight.postage
    order.save

    @cart_items = current_enduser.cart.cart_items
    @cart_items.each do |cart_item|
      @history = History.new
      @history.order_id = order.id
      @history.item_name = cart_item.item.item_name
      @history.artist_name = cart_item.item.artist.artist_name
      @history.quantity = cart_item.quantity
      @history.subtotal = cart_item.subtotal
      @history.item_profile_id = cart_item.item.item_profile_id
      @history.save

          if cart_item.item.stock < cart_item.quantity
              @order = Order.new
              @history = History.new
              @item = Item.new
              @tests = ['__','北海道', '青森県', '岩手県', '宮城県', '秋田県', '山形県', '福島県', '茨城県', '栃木県', '群馬県', '埼玉県', '千葉県', '東京都', '神奈川県', '新潟県', '富山県', '石川県', '福井県', '山梨県', '長野県', '岐阜県', '静岡県', '愛知県', '三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県', '鳥取県', '島根県', '広島県', '山口県', '徳島県', '香川県', '愛媛県', '高知県', '福岡県', '佐賀県', '長崎県', '熊本県', '大分県', '宮崎県', '鹿児島県', '沖縄県']

              @cart = current_enduser.cart
              @cart_items = CartItem.where(cart_id: @cart.id)
              @cart_total_price = 0
              @cart_items.each do |i|
                @cart_total_price += i.subtotal
              end
              flash[:notbuy] = "在庫が足りない商品があった為、購入完了できませんでした"
              judge = "買えない"
              render'new'
          else
           end
    end

       unless judge == "買えない"
          @cart_items.each do |cart_item|
          cart_item.item.decrement!(:stock, cart_item.quantity)
                if cart_item.item.stock == 0
                cart_item.item.update(status:"販売停止中")
                else
                end
           end
         @cart_items.delete_all
         redirect_to orders_complete_path
       else
       end
  end
    
  def complete
  end

private
  def order_params
    params.require(:order).permit(:enduser_id, :address_id, :payment, :total_price, :status)
  end

   def history_params
     params.require(:history).permit(:order_id, :item_name, :artist_name, :quantity, :subtotal, :item_profile_id)
   end

end
