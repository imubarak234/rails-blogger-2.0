class ApiController < ApplicationController
  before_action :set_default_format
  protect_from_forgery with: :null_session
  #include Knock::Authenticable
  #undef_method :current_user

  private

  def set_default_format
    request.format = :json
  end
end