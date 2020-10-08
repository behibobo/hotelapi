class RoomSerializer < ActiveModel::Serializer
  attributes :id, :number, :check_in_hour, :check_out_hour, :images
  has_one :hotel
  has_one :room_type
  
  
  def images
    object.images.map { |image| {id: image.id, url: image.name.url} }
  end
end
