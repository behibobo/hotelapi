class VicinitySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :hotel
end
