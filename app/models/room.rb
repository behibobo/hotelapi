class Room < ApplicationRecord
  belongs_to :hotel
  belongs_to :room_type
  has_many :images, as: :imageable

  has_many :room_facilities, dependent: :destroy
  has_many :facilities, through: :room_facilities
end
