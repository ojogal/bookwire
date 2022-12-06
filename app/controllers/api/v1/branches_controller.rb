# frozen_string_literal: true

module Api
  module V1
    class BranchesController < ApplicationController
      before_action :set_branch, only: %i[show update destroy]

      # GET /api/v1/branches
      def index
        @branches = Branch.all

        render json: @branches
      end

      # GET /api/v1/branches/1
      def show
        render json: @branch
      end

      # POST /api/v1/branches
      def create
        @branch = Branch.new(branch_params)

        if @branch.save
          render json: @branch, status: :created, location: @branch
        else
          render json: @branch.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/branches/1
      def update
        if @branch.update(branch_params)
          render json: @branch
        else
          render json: @branch.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/branches/1
      def destroy
        @branch.destroy
      end

      private

      def set_branch
        @branch = Branch.find(params[:id])
      end

      def branch_params
        params.require(:branch).permit(:alias, :floors)
      end
    end
  end
end
