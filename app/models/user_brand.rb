# frozen_string_literal: true

class UserBrand < ApplicationRecord
  belongs_to :brand
  belongs_to :user
end
