class BranchSerializer
  include JSONAPI::Serializer
  attributes :alias, :floors

  has_many :units
  belongs_to :brand
  belongs_to :location
end
