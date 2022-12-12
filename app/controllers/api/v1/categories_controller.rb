# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: %i[show update destroy]
      before_action :check_current_user, only: %i[create update destroy]

      # GET /api/v1/categories
      def index
        @categories = Category.all
        options = { include: [:brands] }
        render json: CategorySerializer.new(@categories, options).serializable_hash.to_json
      end

      # GET /api/v1/categories/1
      def show
        options = { include: [:brands] }
        render json: CategorySerializer.new(@category, options).serializable_hash.to_json
      end

      # POST /api/v1/categories
      def create
        @category = Category.new(category_params)

        if @category.save
          render json: CategorySerializer.new(@category).serializable_hash.to_json, status: :created, location: @category
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/categories/1
      def update
        if @category.update(category_params)
          render json: CategorySerializer.new(@category).serializable_hash.to_json
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/categories/1
      def destroy
        @category.destroy
      end

      private

      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:title)
      end
    end
  end
end
