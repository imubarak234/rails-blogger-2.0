module Api
  module V1
    class PostsController < ApplicationController
      def index
        hmac_secret = 'my$ecretK3y'

        token = params.require(:token)

        params.require(:token)

        decodes = JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }

        ids = decodes[0]['user_id']

        current_user = User.find(ids)
        post = current_user.posts
        render json: post
      end
    end
  end
end
