class Room < ApplicationRecord
  belongs_to :hotel
  has_many :images, as: :imageable

  enum status: [ :available, :booked ]
end
