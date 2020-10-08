class BookingSerializer < ActiveModel::Serializer
  attributes :id, :check_in_date, :check_out_date, :book_date, :status, :room_type
  has_one :room
  has_one :passenger

  def room_type
    object.room.room_type
  end

  def status
    Booking.statuses[object.status]  
  end
end
