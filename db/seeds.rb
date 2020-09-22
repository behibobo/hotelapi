# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user = User.create(username: "admin", password: "password", age: 35)
provice = File.dirname(File.dirname(File.expand_path(__FILE__))) + '/db/db_province.csv'
city = File.dirname(File.dirname(File.expand_path(__FILE__))) + '/db/db_city.csv'

unless Province.count > 0
    CSV.foreach(provice, :headers => false) do |row|
        Province.create(
            id: row[0],
            name: row[1]
        )
    end
end

unless City.count > 0
    CSV.foreach(city, :headers => false) do |row|
        City.create(
            province_id: row[1],
            name: row[3]
        )
    end
end
