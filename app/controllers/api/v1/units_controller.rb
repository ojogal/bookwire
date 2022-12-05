class Api::V1::UnitsController < ApplicationController
  before_action :set_unit, only: %i[ show update destroy ]

  # GET /api/v1/units
  def index
    @units = Unit.all

    render json: @units
  end

  # GET /api/v1/units/1
  def show
    render json: @unit
  end

  # POST /api/v1/units
  def create
    @unit = Unit.new(unit_params)

    if @unit.save
      render json: @unit, status: :created, location: @unit
    else
      render json: @unit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/units/1
  def update
    if @unit.update(unit_params)
      render json: @unit
    else
      render json: @unit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/units/1
  def destroy
    @unit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unit_params
      params.require(:unit).permit(:seats, :floor)
    end
end
