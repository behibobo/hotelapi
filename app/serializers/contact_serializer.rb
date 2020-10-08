class ContactSerializer < ActiveModel::Serializer
  attributes :id, :contact_type, :value
  has_one :hotel
end
