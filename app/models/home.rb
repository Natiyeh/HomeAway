class Home < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
