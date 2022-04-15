# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    # flash[:notice] = 'You have successfully delete this post.'
    # redirect_to "http://127.0.0.1:3000/users/sign_in"
    if warden.authenticate?(auth_options)
      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
      
    else
      flash[:notice] = 'User does not exist.'
      redirect_to "http://127.0.0.1:3000/users/sign_in" , allow_other_host: true
     end
  end
  

  # DELETE /resource/sign_out
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    #respond_to_on_destroy
    redirect_to "http://127.0.0.1:3000/users/sign_in"
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
