class Facility < ApplicationRecord
    def self.starts_with(column_name, prefix)
        where("lower(#{column_name}) like ?", "#{prefix.downcase}%")
    end
end
