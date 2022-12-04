class Location < ApplicationRecord

  has_many :branches, dependent: :destroy
end
