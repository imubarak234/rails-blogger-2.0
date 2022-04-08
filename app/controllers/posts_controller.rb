class PostsController < ApplicationController
  include ActionView::RecordIdentifier

  def index
    @posts = Post.all
    @users = User.find_by(id: params[:user_id])
    if @users == nil
      @users = User.new
    end
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

    if @post_show == nil
      @post_show = Post.new
    end

    if @user_show == nil
      @user_show = User.new
    end

  end

  def new
    @posts_new = Post.new
    respond_to do |format|
      format.html { render :new, locals: { posts: @posts_new } }
    end
  end

  def create
    current_user_id = params[:user_id]

    post_create = Post.new(params.require(:posts).permit(:title, :text))
    post_create.update(author_id: current_user_id)
    respond_to do |format|
      format.html do
        if post_create.save
          flash[:success] = 'Post created successfully'
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Error: Post could not be created'

          render :new, locals: { posts: @posts_new }
        end
      end
    end
  end
end
