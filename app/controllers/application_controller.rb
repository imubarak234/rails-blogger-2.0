class ApplicationController < ActionController::Base
  
  helper_method :current_user

  def current_user
    if cookies[:user_id]
      User.find(cookies[:user_id])
    end
  end
  
end
