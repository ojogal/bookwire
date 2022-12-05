class Api::V1::BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show update destroy ]

  # GET /api/v1/bookings
  def index
    @bookings = Booking.all

    render json: @bookings
  end

  # GET /api/v1/bookings/1
  def show
    render json: @booking
  end

  # POST /api/v1/bookings
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      render json: @booking, status: :created, location: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/bookings/1
  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/bookings/1
  def destroy
    @booking.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:starts_at, :ends_at)
    end
end
