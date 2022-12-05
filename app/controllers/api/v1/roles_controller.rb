class Api::V1::RolesController < ApplicationController
  before_action :set_role, only: %i[ show update destroy ]

  # GET /api/v1/roles
  def index
    @roles = Role.all

    render json: @roles
  end

  # GET /api/v1/roles/1
  def show
    render json: @role
  end

  # POST /api/v1/roles
  def create
    @role = Role.new(role_params)

    if @role.save
      render json: @role, status: :created, location: @role
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/roles/1
  def update
    if @role.update(role_params)
      render json: @role
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/roles/1
  def destroy
    @role.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def role_params
      params.require(:role).permit(:title)
    end
end
