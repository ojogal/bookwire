# frozen_string_literal: true

module Api
  module V1
    class UnitTypesController < ApplicationController
      before_action :set_unit_type, only: %i[show update destroy]
      before_action :check_owner, only: %i[create update destroy]

      # GET /api/v1/unit_types
      def index
        @unit_types = UnitType.all
        options = { include: [:users] }
        render json: UnitTypeSerializer.new(@unit_types, options).serializable_hash.to_json
      end

      # GET /api/v1/unit_types/1
      def show
        options = { include: [:users] }
        render json: UnitTypeSerializer.new(@unit_type, options).serializable_hash.to_json
      end

      # POST /api/v1/unit_types
      def create
        @unit_type = UnitType.new(unit_type_params)

        if @unit_type.save
          render json: UnitTypeSerializer.new(@unit_type).serializable_hash.to_json, status: :created, location: @unit_type
        else
          render json: @unit_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/unit_types/1
      def update
        if @unit_type.update(unit_type_params)
          render json: UnitTypeSerializer.new(@unit_type).serializable_hash.to_json
        else
          render json: @unit_type.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/unit_types/1
      def destroy
        @unit_type.destroy
      end

      private

      def set_unit_type
        @unit_type = UnitType.find(params[:id])
      end

      def unit_type_params
        params.require(:unit_type).permit(:title, :description)
      end
    end
  end
end
