module Api 
  module V1
    class CommentsController < ApiController
      def index
        user = Comments.all
        render json: user
      end
    end
  end
end