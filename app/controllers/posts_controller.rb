class PostsController < ApplicationController
  def index
    @posts = Post.new.print
  end

  def show
    render 'show'
  end
end
