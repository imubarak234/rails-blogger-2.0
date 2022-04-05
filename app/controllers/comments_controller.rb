class CommentsController < ApplicationController
  def index; end

  def new
    @comment_new = Comment.new
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
end
