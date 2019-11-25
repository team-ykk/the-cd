# frozen_string_literal: true

class Publics::RegistrationsController < Devise::RegistrationsController

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
   def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?

        @cart = Cart.new
        @cart.enduser_id = resource.id
        @cart.save
        @enduser = resource
        @enduser.cart_id = @cart.id
        @enduser.update(enduser_params)

        @address = Address.new
        @address.enduser_id =@enduser.id
        @address.postcode =@enduser.postcode
        @address.name = @enduser.first_name, @enduser.last_name
        @address.prefecture_id = @enduser.prefecture
        @address.address = @enduser.address
        @address.phone_number = @enduser.phone_number
        @address.created_at = @enduser.created_at
        @address.updated_at = @enduser.updated_at
        @address.save

        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end

     #@cart = Cart.new
     #@cart.enduser_id = current_enduser.id
     #@cart.save

     #@enduser = current_enduser
     #@enduser.cart_id = @cart.id
     #@enduser.update(enduser_params)

     #@address = Address.new
     #@address.enduser_id = current_enduser.id
     #@address.postcode =current_enduser.postcode
     #@address.name = current_enduser.first_name, current_enduser.last_name
     #@address.prefecture_id = current_enduser.prefecture
     #@address.address = current_enduser.address
     #@address.phone_number = current_enduser.phone_number
     #@address.created_at = current_enduser.created_at
     #@address.updated_at = current_enduser.updated_at
     #@address.save



   end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
   #def update
    # super
   #end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private
  def enduser_params
    params.require(:enduser).permit(:cart_id)
  end
end
