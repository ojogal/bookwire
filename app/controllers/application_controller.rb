# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Authenticable
  include Authorizable
  include Pundit
end
