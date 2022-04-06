class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user_show = User.find_by(id: params[:id])
    @user_recent = User.new.recent(params[:id])
    cookies[:user_id] = @user_show.id
  end
end
