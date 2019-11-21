class Publics::CartItemsController < ApplicationController

    def create
    	@cart_item = CartItem.new(cart_item_params)
		@cart_item.save
		redirect_to cart_path(current_enduser.cart.id)
    end

    def update
        @cart = Cart.find(params[:id])
        @cart_item = CartItem.find_by(cart_id: @cart.id)
        @cart_item.update(cart_item_params)
        redirect_to cart_path(current_enduser.cart.id)
    end

	private
    def cart_item_params
      params.require(:cart_item).permit(:quantity,:subtotal,:item_id,:cart_id)
    end
end
