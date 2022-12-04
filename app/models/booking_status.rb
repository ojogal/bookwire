class BookingStatus < ApplicationRecord

  has_many :bookings, dependent: :destroy
end
