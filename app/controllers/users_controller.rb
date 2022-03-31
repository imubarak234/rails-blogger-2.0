class UsersController < ApplicationController
  
  def index
    #render 'index'
    @user = User.new
    @user = @user.print
    puts @user
  end

  def lists
    
  end

  def show
    render 'show'
    puts "This is aimed ant standing out in the console #{params[:id]}"
    
  end
end
