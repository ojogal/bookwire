# frozen_string_literal: true

module Api
  module V1
    class UserBrandsController < ApplicationController
      before_action :set_user_brand, only: %i[show update destroy]
      before_action :check_owner, only: %i[create update destroy]

      # GET /api/v1/user_brands
      def index
        @user_brands = UserBrand.all
        options = { include: [:brand, :user] }
        render json: UserBrandSerialzer.new(@user_brands, options).serializable_hash.to_json
      end

      # GET /api/v1/user_brands/1
      def show
        options = { include: [:brand, :user] }
        render json: UserBrandSerialzer.new(@user_brand, options).serializable_hash.to_json
      end

      # POST /api/v1/user_brands
      def create
        @user_brand = UserBrand.new(user_brand_params)

        if @user_brand.save
          render json: UserBrandSerialzer.new(@user_brand).serializable_hash.to_json, status: :created, location: @user_brand
        else
          render json: @user_brand.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/user_brands/1
      def update
        if @user_brand.update(user_brand_params)
          render json: UserBrandSerialzer.new(@user_brand).serializable_hash.to_json
        else
          render json: @user_brand.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/user_brands/1
      def destroy
        @user_brand.destroy
      end

      private

      def set_user_brand
        @user_brand = user_brand.find(params[:id])
      end

      def user_brand_params
        params.require(:user_brand).permit(:first_name, :last_name, :phone, :email)
      end

      def check_owner
        head :forbidden unless @user_brand.id == current_user&.id
      end
    end
  end
end
