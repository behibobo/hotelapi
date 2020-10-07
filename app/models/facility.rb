class Facility < ApplicationRecord

    enum facility_type: [:hotel, :room, :breakfast ]

    def self.starts_with(column_name, prefix)
        where("lower(#{column_name}) like ?", "#{prefix.downcase}%")
    end
end
