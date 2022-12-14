# frozen_string_literal: true

class Branch < ApplicationRecord
  has_many :units, dependent: :destroy
  belongs_to :brand
  belongs_to :location
end
