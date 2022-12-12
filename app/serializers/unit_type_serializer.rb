class UnitTypeSerializer
  include JSONAPI::Serializer
  attributes :title, :description

  has_many :units
end
