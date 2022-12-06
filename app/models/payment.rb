# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :currency
  belongs_to :booking
end
