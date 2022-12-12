# frozen_string_literal: true

module Api
  module V1
    class CurrenciesController < ApplicationController
      before_action :set_currency, only: %i[show update destroy]
      before_action :check_current_user, only: %i[create update destroy]

      # GET /api/v1/currencies
      def index
        @currencies = Currency.all
        options = { include: [:payments] }
        render json: CurrencySerializer.new(@currencies, options).serializable_hash.to_json
      end

      # GET /api/v1/currencies/1
      def show
        options = { include: [:payments] }
        render json: CurrencySerializer.new(@currency, options).serializable_hash.to_json
      end

      # POST /api/v1/currencies
      def create
        @currency = Currency.new(currency_params)

        if @currency.save
          render json: CurrencySerializer.new(@currency).serializable_hash.to_json, status: :created, location: @currency
        else
          render json: @currency.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/currencies/1
      def update
        if @currency.update(currency_params)
          render json: CurrencySerializer.new(@currency).serializable_hash.to_json
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
  end
end
