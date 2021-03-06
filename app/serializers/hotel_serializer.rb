class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :address, :transfer, :lat, :lng, :rank, :details, :images, :facilities, :hotel_facilities
  
  has_one :city
  has_one :user
  has_many :vicinities
  has_many :contacts
  
  def images
    object.images.map { |image| {id: image.id, url: image.name.url} }
  end

  def category
    Hotel.categories[object.category]  
  end

  def facilities
    object.facilities.pluck(:id)
  end

  def hotel_facilities
    object.facilities.map {|f| {id: f.id, name: f.name, type: Facility.facility_types[f.facility_type] }}
  end
  
end
