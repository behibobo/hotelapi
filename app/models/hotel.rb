class Hotel < ApplicationRecord
  belongs_to :city
  belongs_to :user, optional: true
  has_many :images, as: :imageable
  has_many :contracts

  has_many :hotel_facilities
  has_many :facilities, through: :hotel_facilities
  has_many :rooms
  
  def current_contract
    self.contracts.order(created_at: :desc).first
  end

  def is_valid?
    contracts.any? && current_contract.to_date > Date.today
  end

end
