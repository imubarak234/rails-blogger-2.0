class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    puts @like
    flash[:notice] = @like.errors.full_messages.to_sentence unless @like.save
    # post = Post.find_by(id: params[:post_id])

    redirect_to "http://127.0.0.1:3000/users/#{current_user.id}/posts/#{@like.post.id}"
  end

  def destroy
    @like_destroy = current_user.likes.find(params[:id])
    post = @like_destroy.post
    @like_destroy.destroy
    redirect_to "http://127.0.0.1:3000/users/#{current_user.id}/posts/#{post.id}"
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
