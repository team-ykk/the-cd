class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resource)
		if resource.is_a?(Admin)
		  admins_items_path
		else
		  root_path
		end
	end

	def after_sign_out_path_for(resource)
	    if resource == :admin
	      new_admin_session_path
	    else
	      new_enduser_session_path
	    end
	end

	def routing_error
	  render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
	end

	def after_sign_in_path_for(resource)
      if current_enduser
        flash[:notice] = ""
        items_path  #　指定したいパスに変更
      else
        flash[:notice] = ""
        items_path  #　指定したいパスに変更
      end
    end

	def configure_permitted_parameters
	  added_attrs = [ :first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :prefecture, :address, :phone_number, :email, :encrypted_password,:cart_id]
	  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      #devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :prefecture, :address, :phone_number, :email, :encrypted_password])
      #devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password])
    end
end
