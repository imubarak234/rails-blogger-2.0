module Api
  module V1
    class AuthenticationController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing

      def create
        params.require(:password)

        user = User.find_by(email: params.require(:email))
        token = AuthenticationTokenService.call(user.id)

        render json: { token: }, status: :created
      end

      private

      def parameter_missing(error)
        render json: { error: error.message }, status: :unprocessable_entity
      end
    end
  end
end
