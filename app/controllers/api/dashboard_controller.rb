class Api::DashboardController < ApplicationController

	def index
			hotels = Hotel.all
			rooms = [
				{
					type: "single",
					count: 0
				},
				{
					type: "double",
					count: 0
				},
				{
					type: "suite",
					count: 0
				}

			]
			

			hotels.each do |hotel|
				if hotel.rooms.where(room_type: :single).any?

					rooms.first.count += hotel.rooms.where(room_type: :single).first.count
				end

				if hotel.rooms.where(room_type: :double).any?
					rooms.second.count += hotel.rooms.where(room_type: :double).first.count
				end

				if hotel.rooms.where(room_type: :suite).any?
					rooms.last.count += hotel.rooms.where(room_type: :suite).first.count
				end
			end
			data = {
				hotels: hotels,
				rooms: rooms
			}
			render json: data
	end
end
