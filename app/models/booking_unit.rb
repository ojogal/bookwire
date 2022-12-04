class BookingUnit < ApplicationRecord

  belongs_to :booking
  belongs_to :unit
end
