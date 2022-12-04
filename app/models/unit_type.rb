class UnitType < ApplicationRecord

  has_many :units, dependent: :destroy
end
