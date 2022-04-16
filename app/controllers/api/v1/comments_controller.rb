module Api 
  module V1
    class CommentsController < ApiController
      ALLOWED_DATA = %[text].freeze
      def index
        @post = Post.find(params[:post_id])
        comments = post.comments
        render json: comments
      end

      def create
        post = Post.find(params[:post_id])
        current_user = User.find(post.author_id)
        data = json_payload.select { |k| ALLOWED_DATA.include?(k)}
        comment = Comment.new(data)
        comment.update(author: current_user)
        comment.update(post: post)

        if comment.save
          render json: comment
        else
          render json: {"error": "could not create comment"}
        end
      end
    end
  end
end