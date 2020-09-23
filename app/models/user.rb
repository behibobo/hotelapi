class User < ApplicationRecord
    has_secure_password

    enum role: [:user, :admin]

    def self.starts_with(column_name, prefix)
        where("lower(#{column_name}) like ?", "#{prefix.downcase}%")
    end
end
