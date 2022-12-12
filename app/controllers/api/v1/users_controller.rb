# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]
      before_action :check_current_user, only: %i[create update destroy]

      # GET /api/v1/users
      def index
        @users = User.all
        options = { include: [:bookings] }
        render json: UserSerializer.new(@users, options).serializable_hash.to_json
      end

      # GET /api/v1/users/1
      def show
        options = { include: [:bookings] }
        render json: UserSerializer.new(@user, options).serializable_hash.to_json
      end

      # POST /api/v1/users
      def create
        @user = User.new(user_params)

        if @user.save
          render json: UserSerializer.new(@user).serializable_hash.to_json, status: :created, location: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/users/1
      def update
        if @user.update(user_params)
          render json: UserSerializer.new(@user).serializable_hash.to_json
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/users/1
      def destroy
        @user.destroy
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:first_name, :last_name, :phone, :email)
      end

      def check_current_user
        head :forbidden unless @user.id == current_user&.id
      end
    end
  end
end
