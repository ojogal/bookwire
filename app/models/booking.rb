# frozen_string_literal: true

class Booking < ApplicationRecord
  has_many :payments, dependent: :destroy
  belongs_to :booking_status
  belongs_to :user

  has_many :booking_units, dependent: :destroy
  has_many :units, through: :booking_units
end
