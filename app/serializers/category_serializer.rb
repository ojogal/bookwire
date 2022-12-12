class CategorySerializer
  include JSONAPI::Serializer
  attributes :title

  has_many :brands
end
