class BrandSerializer
  include JSONAPI::Serializer
  attributes :title

  has_many :branches
  belongs_to :category
end
