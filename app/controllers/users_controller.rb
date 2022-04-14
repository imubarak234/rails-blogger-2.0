class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user_show = User.find_by(id: params[:id])
    @user_recent = User.new.recent(params[:id])
    @user_show = User.new if @user_show.nil?
  end
end
