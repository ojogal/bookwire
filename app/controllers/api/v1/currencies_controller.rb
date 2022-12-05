class Api::V1::CurrenciesController < ApplicationController
  before_action :set_currency, only: %i[ show update destroy ]

  # GET /api/v1/currencies
  def index
    @currencies = Currency.all

    render json: @currencies
  end

  # GET /api/v1/currencies/1
  def show
    render json: @currency
  end

  # POST /api/v1/currencies
  def create
    @currency = Currency.new(currency_params)

    if @currency.save
      render json: @currency, status: :created, location: @currency
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/currencies/1
  def update
    if @currency.update(currency_params)
      render json: @currency
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/currencies/1
  def destroy
    @currency.destroy
  end

  private
    def set_currency
      @currency = Currency.find(params[:id])
    end

    def currency_params
      params.require(:currency).permit(:number, :symbol, :code)
    end
end
