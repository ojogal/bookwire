# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include DataValidation

  primary_abstract_class
end
