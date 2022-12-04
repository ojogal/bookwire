class Brand < ApplicationRecord

  has_many :branches, dependent: :destroy
  has_many :users, through: :uaer_brands
  belongs_to :category
end