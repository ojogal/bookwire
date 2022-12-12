# frozen_string_literal: true

module Api
  module V1
    class LocationsController < ApplicationController
      before_action :set_location, only: %i[show update destroy]
      before_action :check_current_user, only: %i[create update destroy]

      # GET /api/v1/locations
      def index
        @locations = Location.all
        options = { include: [:branches] }
        render json: LocationSerializer.new(@locations, options).serializable_hash.to_json
      end

      # GET /api/v1/locations/1
      def show
        options = { include: [:branches] }
        render json: LocationSerializer.new(@location, options).serializable_hash.to_json
      end

      # POST /api/v1/locations
      def create
        @location = Location.new(location_params)

        if @location.save
          render json: LocationSerializer.new(@location).serializable_hash.to_json, status: :created, location: @location
        else
          render json: @location.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/locations/1
      def update
        if @location.update(location_params)
          render json: LocationSerializer.new(@location).serializable_hash.to_json
        else
          render json: @location.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/locations/1
      def destroy
        @location.destroy
      end

      private

      def set_location
        @location = Location.find(params[:id])
      end

      def location_params
        params.require(:location).permit(:country, :state, :city, :street, :building)
      end
    end
  end
end
