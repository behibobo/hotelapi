class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :lat, :lng, :rank, :images
  
  has_one :city
  has_one :user
  has_many :facilities
  
  def images
    object.images.map { |image| {id: image.id, url: image.name.url} }
  end

  
end
