module Api 
  module V1
    class PostsController < ApiController
      def index
        user = Post.all
        render json: user
      end
    end
  end
end