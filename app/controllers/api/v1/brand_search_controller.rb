# frozen_string_literal: true

module Api
    module V1
        class BrandSearchController < ApplicationController
            before_action :set_branch, only: %i[show update destroy]
            before_action :check_current_user, only: %i[create update destroy]

            # GET /api/v1/brand_search
            def index
            @search = params[:searchPhrase]
            @brands = Brand.where("LOWER(title) like LOWER('%#{@search}%')").all
            options = { include: [:branches, :category] }
            render json: BrandSerializer.new(@brands, options).serializable_hash.to_json
            end
        end
    end
end