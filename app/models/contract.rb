class Contract < ApplicationRecord
  belongs_to :hotel

  enum status: [ :active, :archived ]
end
