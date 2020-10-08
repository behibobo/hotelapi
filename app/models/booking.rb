class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :passenger

  enum status: [:pending, :confirmed, :canceled]
end
