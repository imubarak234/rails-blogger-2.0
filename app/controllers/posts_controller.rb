class PostsController < ApplicationController
  def index
    @posts = Post.new.print
    @users = User.new.info(params[:user_id])
    # @post_comments
  end

  def comments(id)
    Post.new.recent_comments(id)
  end

  def comments_all(id)
    Post.new.recent_comments_all(id)
  end

  helper_method :comments, :comments_all

  def show
    @post_show = Post.new.info(params[:id])
    @user_show = User.new.info(params[:user_id])
  end
end
