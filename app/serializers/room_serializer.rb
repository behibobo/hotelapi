class RoomSerializer < ActiveModel::Serializer
  attributes :id, :number, :check_in_hour, :check_out_hour, :images, :facilities, :room_facilities
  has_one :hotel
  has_one :room_type
  
  
  def images
    object.images.map { |image| {id: image.id, url: image.name.url} }
  end

  def facilities
    object.facilities.pluck(:id)
  end

  def room_facilities
    object.facilities.map {|f| {id: f.id, name: f.name }}
  end
end
