class RoleSerializer
  include JSONAPI::Serializer
  attributes :title

  has_many :users
end
