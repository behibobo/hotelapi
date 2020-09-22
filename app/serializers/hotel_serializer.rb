class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :lat, :lng, :rank, :images, :facilities
  
  has_one :city
  has_one :user
  
  def images
    object.images.map { |image| {id: image.id, url: image.name.url} }
  end

  def facilities
    object.facilities.pluck(:id)
  end

  
end
