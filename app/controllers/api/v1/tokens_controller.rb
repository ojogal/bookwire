# frozen_string_literal: true

module Api
  module V1
    class TokensController < ApplicationController
      def create
        @user = User.find_by_email(user_params[:email])
        if @user
          puts @user.email, @user.phone
          render json: {
            token: JsonWebToken.encode(user_id: @user.id),
            email: @user.email
          }
        else
          head :unauthorized
        end
      end

      private

      def user_params
        params.require(:user).permit(:email)
      end
    end
  end
end
