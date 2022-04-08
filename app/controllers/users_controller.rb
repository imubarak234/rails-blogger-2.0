class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user_show = User.find_by(id: params[:id])
    @user_recent = User.new.recent(params[:id])
    if @user_show != nil
      cookies[:user_id] = @user_show.id
    else
      @user_show = User.new
    end

  end
end
