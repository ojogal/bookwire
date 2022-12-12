class PaymentSerializer
  include JSONAPI::Serializer
  attributes :amount

  belongs_to :currency
  belongs_to :booking
end
