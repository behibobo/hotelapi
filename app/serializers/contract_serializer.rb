class ContractSerializer < ActiveModel::Serializer
  attributes :id, :from_date, :to_date, :status
  has_one :hotel
end
