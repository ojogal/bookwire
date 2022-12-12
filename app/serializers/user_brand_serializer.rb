class UserBrandSerializer
  include JSONAPI::Serializer
  attributes 

  belongs_to :brand
  belongs_to :user
end
