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

  def check_in_shamsi
    object.check_in_date.to_date.to_pdate.to_s
  end

  def check_out_shamsi
    object.check_out_date.to_date.to_pdate.to_s
  end

  def book_shamsi
    object.book_date.to_date.to_pdate.to_s
  end

end
