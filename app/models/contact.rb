class Contact < ApplicationRecord
  belongs_to :hotel

  enum contact_type: [:phone, :mobile, :email]
end
