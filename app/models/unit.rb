# frozen_string_literal: true

class Unit < ApplicationRecord
  has_many :bookings, through: :booking_units
  belongs_to :unit_type
  belongs_to :branch
end
