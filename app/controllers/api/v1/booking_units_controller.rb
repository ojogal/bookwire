# frozen_string_literal: true

module Api
  module V1
    class BookingUnitsController < ApplicationController
      before_action :set_booking_unit!, only: %i[show update destroy]
      before_action :check_owner, only: %i[create update destroy]

      # GET /api/v1/booking_units
      def index
        @booking_units = BookingUnit.all
        options = { include: [:booking, :unit] }
        render json: BookingUnitSerializer.new(@booking_units, options).serializable_hash.to_json
      end

      # GET /api/v1/booking_units/1
      def show
        options = { include: [:booking, :unit] }
        render json: BookingUnitSerilizer.new(@booking_unit, options).serializable_hash.to_json
      end

      # POST /api/v1/booking_units
      def create
        @booking_unit = BookingUnit.new(booking_unit_params)

        if @booking_unit.save
          render json: BookingUnitSerilizer.new(@booking_unit).serializable_hash.to_json, status: :created, location: @booking_unit
        else
          render json: @booking_unit.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/booking_units/1
      def update
        if @booking_unit.update(booking_unit_params)
          render json: BookingUnitSerilizer.new(@booking_unit).serializable_hash.to_json
        else
          render json: @booking_unit.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/booking_units/1
      def destroy
        @booking_unit.destroy
      end

      private

      def set_booking_unit!
        @booking_unit = BookingUnit.find(params[:id])
      end

      def booking_unit_params
        params.require(:booking_unit).permit(:starts_at, :ends_at)
      end
    end
  end
end
