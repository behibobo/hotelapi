class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :passenger
end
