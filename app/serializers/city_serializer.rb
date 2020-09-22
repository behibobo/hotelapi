class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :province, :province_name

  def province
    ActiveModelSerializers::SerializableResource.new(object.province)
  end

  def province_name
    object.province.name
  end
end
