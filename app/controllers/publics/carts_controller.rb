class Publics::CartsController < Publics::ApplicationController
  before_action :correct_user, only: [:show]

  def show
  	@cart = current_enduser.cart
    @cart_item = CartItem.find_by(cart_id: @cart.id)
    @cart_items = CartItem.where(cart_id: @cart.id)

    @cart_total_price = 0
    @cart_items.each do |i|
    @cart_total_price += i.subtotal
    end
  end

  def create
  end

  def destroy
  end

  def update
  end

  private
    def correct_user
      @cart = Cart.find(params[:id])
      if current_enduser.id != @cart.enduser_id
        redirect_to items_path
        end
      end
end
