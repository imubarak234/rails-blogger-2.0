class PostsController < ApplicationController
  load_and_authorize_resource
  include ActionView::RecordIdentifier

  def index
    @users = User.find_by(id: params[:user_id])
    @users = User.new if @users.nil?
    @posts = Post.all

    # @posts = Post.where(author_id: @users).includes(:comments).order(created_at: :desc)
  end

  def comments_all(id)
    Post.new.recent_comments_all(id)
  end

  helper_method :comments_all

  def show
    @post_show = Post.find_by(id: params[:id])
    @user_show = User.find_by(id: params[:user_id])

    @post_show = Post.new if @post_show.nil?

    @user_show = User.new if @user_show.nil?
  end

  def new
    @posts_new = current_user.posts.new
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

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash[:notice] = 'You have successfully delete this post.'
    redirect_to "http://127.0.0.1:3000/users/#{current_user.id}/posts"
  end
end

# def destroy
#   @like_destroy = current_user.likes.find(params[:id])
#   post = @like_destroy.post
#   @like_destroy.destroy
#   redirect_to "http://127.0.0.1:3000/users/#{current_user.id}/posts/#{post.id}"
# end
