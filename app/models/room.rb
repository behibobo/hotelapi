class Room < ApplicationRecord
  belongs_to :hotel
  has_many :images, as: :imageable

  enum room_type: [ :single, :double, :suite ]
end
