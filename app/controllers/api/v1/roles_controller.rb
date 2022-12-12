# frozen_string_literal: true

module Api
  module V1
    class RolesController < ApplicationController
      before_action :set_role, only: %i[show update destroy]
      before_action :check_current_user, only: %i[create update destroy]

      # GET /api/v1/roles
      def index
        @roles = Role.all
        options = { include: [:users] }
        render json: RoleSerializer.new(@roles, options).serializable_hash.to_json
      end

      # GET /api/v1/roles/1
      def show
        options = { include: [:users] }
        render json: RoleSerializer.new(@role, options).serializable_hash.to_json
      end

      # POST /api/v1/roles
      def create
        @role = Role.new(role_params)

        if @role.save
          render json: RoleSerializer.new(@role).serializable_hash.to_json, status: :created, location: @role
        else
          render json: @role.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/roles/1
      def update
        if @role.update(role_params)
          render json: RoleSerializer.new(@role).serializable_hash.to_json
        else
          render json: @role.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/roles/1
      def destroy
        @role.destroy
      end

      private

      def set_role
        @role = Role.find(params[:id])
      end

      def role_params
        params.require(:role).permit(:title)
      end
    end
  end
end
