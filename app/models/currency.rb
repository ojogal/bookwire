class Currency < ApplicationRecord

  has_many :payments, dependent: :destroy
end
