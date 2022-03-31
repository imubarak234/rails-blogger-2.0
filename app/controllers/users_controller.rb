class UsersController < ApplicationController
  def index
    # render 'index'
    @user = User.new
    @user = @user.print
  end

  def show
    puts "This is aimed ant standing out in the console #{params[:id]}"
    @user_show = User.new.info(params[:id])
    @user_recent = User.new.recent(params[:id])
  end
end
