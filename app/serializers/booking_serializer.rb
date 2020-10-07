class BookingSerializer < ActiveModel::Serializer
  attributes :id, :check_in_date, :check_out_date, :book_date, :status
  has_one :room
  has_one :passenger
end
