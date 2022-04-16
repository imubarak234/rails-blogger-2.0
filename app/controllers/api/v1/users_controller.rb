module Api
  module V1
    class UsersController < ApiController
      def index
        hmac_secret = 'my$ecretK3y'

        token = params.require(:token)

        params.require(:token)

        decodes = JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }

        ids = decodes[0]['user_id']

        current_user = User.find(ids)
        render json: current_user
      end
    end
  end
end
