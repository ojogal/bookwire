class BookingSerializer
  include JSONAPI::Serializer
  attributes :starts_at, :ends_at

  belongs_to :booking_status
  belongs_to :user
end
