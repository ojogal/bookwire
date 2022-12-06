# frozen_string_literal: true

class UnitType < ApplicationRecord
  has_many :units, dependent: :destroy
end
