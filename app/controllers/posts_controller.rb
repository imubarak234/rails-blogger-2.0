class PostsController < ApplicationController
  def index
    @posts = Post.all
    @users = User.find_by(id: params[:user_id])
  end

  def comments(id)
    Post.new.recent_comments(id)
  end

  def comments_all(id)
    Post.new.recent_comments_all(id)
  end

  helper_method :comments, :comments_all

  def show
    @post_show = Post.find_by(id: params[:id])
    @user_show = User.find_by(id: params[:user_id])
  end
end
