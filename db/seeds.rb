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
#RoomType.destroy_all
Booking.destroy_all
Passenger.destroy_all
Room.destroy_all
Hotel.destroy_all
User.destroy_all


#RoomType.create(name: "single")
#RoomType.create(name: "double")
#RoomType.create(name: "suit")

User.create(username: "admin", password: "password", role: "admin")
20.times do
    Passenger.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "password",
        phone: Faker::PhoneNumber.cell_phone,
    )
end
40.times do 
    user = User.create(
        username: Faker::Internet.email,
        password: "password",
        role: "user"
    )
    hotel = Hotel.create(
        name: Faker::Name.name,
        address: Faker::Address.street_address,
        details: Faker::Lorem.sentences,
        user: user,
        rank: [1,2,3,4,5].sample,
        city: City.all.sample,
        lat:Faker::Address.latitude,
        lng:Faker::Address.longitude,
    )


    [101,102,103,201,202].shuffle.each do |n|
        room = Room.create!(hotel: hotel, room_type: RoomType.all.sample, number: n.to_s, check_in_hour: "12:00", check_out_hour: "11:00")
    end

    Booking.create!(
        room: hotel.rooms.first, 
        check_in_date: Faker::Date.between(from: Date.today  + 2.days, to: Date.today + 10.days),
        check_out_date: Faker::Date.between(from: Date.today  + 4.days, to: Date.today + 15.days), 
        book_date: Faker::Date.between(from: Date.today, to: Date.today + 3.days), 
        passenger: Passenger.all.sample,
        status: [0,1,2].sample
    )

    Booking.create!(
        room: hotel.rooms.last, 
        check_in_date: Faker::Date.between(from: Date.today  + 2.days, to: Date.today + 10.days),
        check_out_date: Faker::Date.between(from: Date.today  + 4.days, to: Date.today + 15.days), 
        book_date: Faker::Date.between(from: Date.today, to: Date.today + 3.days), 
        passenger: Passenger.all.sample,
        status: [0,1,2].sample
    )
end
