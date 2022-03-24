class UsersController < ApplicationController
  def index
    render 'all_users'
  end

  def show
    render 'users_profile'
  end
end
