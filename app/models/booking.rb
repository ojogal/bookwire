class Booking < ApplicationRecord

  has_many :payments, dependent: :destroy
  has_many :units, through: :booking_units
  belongs_to :booking_status
  belongs_to :user
end
