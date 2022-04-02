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

    puts 'lllllllllllllllll'
    comment = Comment.new(params.require(:comment_new).permit(:text))
    comment.update(author_id: current_user_id)
    comment.update(post_id: current_post_id)

    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment created successfully'
          puts 'pass pass'
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Error: Comment not created'
          puts 'fail lllllllllll'
          puts 'fail lllllllllll'
          puts 'fail lllllllllll'
          # puts params
          render :new, locals: { posts: @comment_new }
        end
      end
    end
  end
end
