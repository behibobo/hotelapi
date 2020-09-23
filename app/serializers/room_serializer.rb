class RoomSerializer < ActiveModel::Serializer
  attributes :id, :room_type, :room_no, :status, :images
  has_one :hotel

  def images
    object.images.map { |image| {id: image.id, url: image.name.url} }
  end
end