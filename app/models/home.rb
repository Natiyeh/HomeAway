class Home < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
