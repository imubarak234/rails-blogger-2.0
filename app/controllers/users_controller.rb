class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user_show = User.find_by(id: params[:id])
    @user_recent = User.new.recent(params[:id])
  end

  def new
    user_new = User.new
    respond_to do |format|
      format.html { render :new, locals: { user_new: user_new } }
    end
  end

  def create
    post_create = Post.new(params.require(:user).permit(:author_id, :title, :text))

    respond_to do |format|
      format.html do

        if post_create.save
          flash[:success] = "Post created successfully"
          redirect_to users_url
        else
          flash.now[:error] = "Error: Post could not be created"

          render :new, locals: { user_new: user_new }
        end
      end
    end
  end
end
