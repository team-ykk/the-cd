class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
	  added_attrs = [ :first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :prefecture, :address, :phone_number, :email, :encrypted_password,:cart_id]
	  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      #devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :prefecture, :address, :phone_number, :email, :encrypted_password])
      #devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password])
    end
end
