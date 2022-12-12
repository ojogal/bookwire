# frozen_string_literal: true

module Api
  module V1
    class PaymentsController < ApplicationController
      before_action :set_payment, only: %i[show update destroy]
      before_action :check_current_user

      # GET /api/v1/payments
      def index
        @payments = Payment.all
        options = { include: [:currency, :booking] }
        render json: PaymentSerializer.new(@payments, options).serializable_hash.to_json
      end

      # GET /api/v1/payments/1
      def show
        options = { include: [:currency, :booking] }
        render json: PaymentSerializer.new(@payment, options).serializable_hash.to_json
      end

      # POST /api/v1/payments
      def create
        @payment = Payment.new(payment_params)

        if @payment.save
          render json: PaymentSerializer.new(@payment).serializable_hash.to_json, status: :created, location: @payment
        else
          render json: @payment.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/payments/1
      def update
        if @payment.update(payment_params)
          render json: PaymentSerializer.new(@payment).serializable_hash.to_json
        else
          render json: @payment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/payments/1
      def destroy
        @payment.destroy
      end

      private

      def set_payment
        @payment = Payment.find(params[:id])
      end

      def payment_params
        params.require(:payment).permit(:amount)
      end
    end
  end
end
