class Bike < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :model, :address, :price, presence: true
end
