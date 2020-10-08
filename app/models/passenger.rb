class Passenger < ApplicationRecord
    has_secure_password

    enum status: [:active, :inactive]
end
