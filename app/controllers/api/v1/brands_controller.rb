# frozen_string_literal: true

module Api
  module V1
    class BrandsController < ApplicationController
      before_action :set_brand, only: %i[show update destroy]
      before_action :check_current_user, only: %i[create update destroy]

      # GET /api/v1/brands
      def index
        @brands = Brand.all
        options = { include: [:branches, :category] }
        render json: BrandSerializer.new(@brands, options).serializable_hash.to_json
      end

      # GET /api/v1/brands/1
      def show
        options = { include: [:branches, :category] }
        render json: BrandSerializer.new(@brand, options).serializable_hash.to_json
      end

      # POST /api/v1/brands
      def create
        @brand = Brand.new(brand_params)

        if @brand.save
          render json: BrandSerializer.new(@brand).serializable_hash.to_json, status: :created, location: @brand
        else
          render json: @brand.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/brands/1
      def update
        if @brand.update(brand_params)
          render json: BrandSerializer.new(@brand).serializable_hash.to_json
        else
          render json: @brand.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/brands/1
      def destroy
        @brand.destroy
      end

      private

      def set_brand
        @brand = Brand.find(params[:id])
      end

      def brand_params
        params.require(:brand).permit(:title)
      end
    end
  end
end
