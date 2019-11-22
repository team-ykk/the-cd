class Publics::CartItemsController < ApplicationController

    def create
    	@cart_item = CartItem.new(cart_item_params)
		@cart_item.save
		redirect_to cart_path(current_enduser.cart.id)
    end

    def update
        @cart = current_enduser.cart
        @cart_item = CartItem.find(params[:id])
        new_quantity = params[:cart_item][:quantity].to_i
        new_subtotal = new_quantity * ((@cart_item.item.price).to_i) * (Tax.find(1).tax_rate)
        @cart_item.update(quantity: new_quantity, subtotal: new_subtotal)
        redirect_to cart_path(@cart.id)
    end

    def destroy
        @cart = current_enduser.cart
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        redirect_to cart_path(@cart.id)
    end

	private
    def cart_item_params
      params.require(:cart_item).permit(:quantity, :subtotal, :cart_id, :item_id)
    end
end
