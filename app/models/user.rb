class User < ApplicationRecord

  before_validation :normalize_name, on: :create

  validates :email, uniqueness: true
  validates_format_of :email, with: /@/

  belongs_to :role
  has_many :bookings, dependent: :destroy
  has_many :brands, through: :user_brands

  private
  def normalize_name
    self.first_name = first_name.downcase.titleize
    self.last_name = last_name.downcase.titleize
  end
end