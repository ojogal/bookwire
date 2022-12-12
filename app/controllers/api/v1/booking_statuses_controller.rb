# frozen_string_literal: true

module Api
  module V1
    class BookingStatusesController < ApplicationController
      before_action :set_booking_status, only: %i[show update destroy]
      before_action :check_owner, only: %i[create update destroy]

      # GET /api/v1/booking_statuses
      def index
        @booking_statuses = BookingStatus.all
        optoins = { include: [:bookings] }
        render json: BookingStatusSerializer.new(@booking_statuses, optoins).serializable_hash.to_json
      end

      # GET /api/v1/booking_statuses/1
      def show
        options = { include: [:bookings] }
        render json: BookingStatusSerializer.new(@booking_status, options).serializable_hash.to_json
      end

      # POST /api/v1/booking_statuses
      def create
        @booking_status = BookingStatus.new(booking_status_params)

        if @booking_status.save
          render json: BookingStatusSerializer.new(@booking_status).serializable_hash.to_json, status: :created, location: @booking_status
        else
          render json: @booking_status.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/booking_statuses/1
      def update
        if @booking_status.update(booking_status_params)
          render json: BookingStatusSerializer.new(@booking_status).serializable_hash.to_json
        else
          render json: @booking_status.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/booking_statuses/1
      def destroy
        @booking_status.destroy
      end

      private

      def set_booking_status
        @booking_status = BookingStatus.find(params[:id])
      end

      def booking_status_params
        params.require(:booking_status).permit(:title, :description)
      end
    end
  end
end
