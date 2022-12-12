class UnitSerializer
  include JSONAPI::Serializer
  attributes :seats, :is_reserved, :floor

  belongs_to :unit_type
  belongs_to :branch
end
