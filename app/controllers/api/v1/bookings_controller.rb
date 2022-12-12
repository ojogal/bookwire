# frozen_string_literal: true

module Api
  module V1
    class BookingsController < ApplicationController
      before_action :set_booking!, only: %i[show update destroy]
      before_action :check_current_user, only: %i[create update destroy]
      
      before_action :authorize_booking!
      after_action :verify_authorized

      # GET /api/v1/bookings
      def index
        @bookings = Booking.all
        options = { include: [:booking_status, :user] }
        render json: BookingSerializer.new(@bookings, options).serializable_hash.to_json
      end

      # GET /api/v1/bookings/1
      def show
        options = { include: [:booking_status, :user] }
        render json: BookingSerializer.new(@booking, options).serializable_hash.to_json
      end

      # POST /api/v1/bookings
      def create
        @booking = Booking.new(booking_params)

        if @booking.save
          render json: BookingSerializer.new(@booking).serializable_hash.to_json, status: :created, location: @booking
        else
          render json: @booking.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/bookings/1
      def update
        if @booking.update(booking_params)
          render json: BookingSerializer.new(@booking).serializable_hash.to_json
        else
          render json: @booking.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/bookings/1
      def destroy
        @booking.destroy
      end

      private

      def set_booking!
        @booking = Booking.find(params[:id])
      end

      def booking_params
        params.require(:booking).permit(:starts_at, :ends_at)
      end

      def authorize_booking!
        authorize(@booking || Booking)
      end
    end
  end
end
