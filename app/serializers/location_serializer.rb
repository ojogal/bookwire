class LocationSerializer
  include JSONAPI::Serializer
  attributes :country, :state, :city, :district, :street, :building

  has_many :branches
end
