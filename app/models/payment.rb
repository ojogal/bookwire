class Payment < ApplicationRecord

  belongs_to :currency
  belongs_to :booking
end
