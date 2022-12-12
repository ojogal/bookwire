class BookingUnitSerializer
  include JSONAPI::Serializer
  attributes

  belongs_to :booking
  belongs_to :unit
end
