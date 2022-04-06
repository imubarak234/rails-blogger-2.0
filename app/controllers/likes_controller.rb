class LikesController < ApplicationController

  def create
    @like = current_user.likes.new(like_params)
    if !@like.save
      flash[:notice] = @like.errors.full_message.to_sentence
    end

    redirect_to @like.post
  end

  def destory
    @like = current_user.likes.find.(params[:id])
    post = @like.post
    @like.destory
    redirect_to post
  end

  private 

  def like_params
    params.require(:like).permit(:post_id)
  end

end