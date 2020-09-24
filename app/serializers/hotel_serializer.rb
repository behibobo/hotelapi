class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :lat, :lng, :rank, :images, :facilities, :booked_rooms, :available_rooms
  
  has_one :city
  has_one :user
  
  def images
    object.images.map { |image| {id: image.id, url: image.name.url} }
  end

  def facilities
    object.facilities.pluck(:id)
  end

  def booked_rooms
    object.rooms.where(status: :booked).count
  end

  def available_rooms
    object.rooms.where(status: :available).count
  end
  
end
