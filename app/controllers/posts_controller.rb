class PostsController < ApplicationController
  def index
    render 'all_posts'
  end

  def show
    render 'posts_profile'
  end
end
