class BookingStatusSerializer
  include JSONAPI::Serializer
  attributes :title, :description

  has_many :bookings
end
