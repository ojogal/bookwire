class CurrencySerializer
  include JSONAPI::Serializer
  attributes :number, :symbol, :code

  has_many :payments
end
