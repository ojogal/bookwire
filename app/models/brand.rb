# frozen_string_literal: true

class Brand < ApplicationRecord
  has_many :branches, dependent: :destroy
  belongs_to :category

  has_many :user_brands, dependent: :destroy
  has_many :users, through: :user_brands
end
