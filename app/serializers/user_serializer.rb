class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :phone, :email

  belongs_to :role
  has_many :bookings
end
