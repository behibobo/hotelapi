class FacilitySerializer < ActiveModel::Serializer
  attributes :id, :name, :facility_type

  def facility_type
    Facility.facility_types[object.facility_type]  
  end
end
