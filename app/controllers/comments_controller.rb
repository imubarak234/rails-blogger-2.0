class CommentsController < ApplicationController
  load_and_authorize_resource

  def index; end

  def new
    #@like = current_user.likes.new(like_params)
    @comment_new = current_user.comments.new(post_id: params[:post_id])
    respond_to do |format|
      format.html { render :new, locals: { comment_new: @comment_new } }
    end
  end

  def create
    current_post_id = params[:post_id]
    current_user_id = params[:user_id]

    comment = Comment.new(params.require(:comment_new).permit(:text))
    comment.update(author_id: current_user_id)
    comment.update(post_id: current_post_id)

    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment created successfully'
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Error: Comment not created'
          render :new, locals: { posts: @comment_new }
        end
      end
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = 'You have successfully delete this comment.'
    redirect_to "http://127.0.0.1:3000/users/#{current_user.id}/posts/#{params[:post_id]}"
  end

end
