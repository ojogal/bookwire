# frozen_string_literal: true

module Api
  module V1
    class LocationsController < ApplicationController
      before_action :set_location, only: %i[show update destroy]

      # GET /api/v1/locations
      def index
        @locations = Location.all

        render json: @locations
      end

      # GET /api/v1/locations/1
      def show
        render json: @location
      end

      # POST /api/v1/locations
      def create
        @location = Location.new(location_params)

        if @location.save
          render json: @location, status: :created, location: @location
        else
          render json: @location.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/locations/1
      def update
        if @location.update(location_params)
          render json: @location
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
