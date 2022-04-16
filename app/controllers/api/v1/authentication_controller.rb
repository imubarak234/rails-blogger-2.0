module Api
  module V1
    class AuthenticationController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing

      def create
        params.require(:password)

        user = User.find_by(email: params.require(:email))

        if user
          tokens = AuthenticationTokenService.call(user.id)

          render json: { token: tokens }, status: :created
        else
          render json: { error: 'User does not exist' }
        end
      end

      private

      def parameter_missing(error)
        render json: { error: error.message }, status: :unprocessable_entity
      end
    end
  end
end
