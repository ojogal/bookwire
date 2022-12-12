# frozen_string_literal: true

module Api
  module V1
    class UnitsController < ApplicationController
      before_action :set_unit, only: %i[show update destroy]
      before_action :check_current_user, only: %i[create update destroy]

      # GET /api/v1/units
      def index
        @units = Unit.all
        options = { include: [:unit_type, :branch] }
        render json: UnitSerializer.new(@units, options).serializable_hash.to_json
      end

      # GET /api/v1/units/1
      def show
        options = { include: [:unit_type, :branch] }
        render json: UnitSerializer.new(@unit, options).serializable_hash.to_json
      end

      # POST /api/v1/units
      def create
        @unit = Unit.new(unit_params)

        if @unit.save
          render json: UnitSerializer.new(@unit).serializable_hash.to_json, status: :created, location: @unit
        else
          render json: @unit.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/units/1
      def update
        if @unit.update(unit_params)
          render json: UnitSerializer.new(@unit).serializable_hash.to_json
        else
          render json: @unit.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/units/1
      def destroy
        @unit.destroy
      end

      private

      def set_unit
        @unit = Unit.find(params[:id])
      end

      def unit_params
        params.require(:unit).permit(:seats, :floor)
      end
    end
  end
end
