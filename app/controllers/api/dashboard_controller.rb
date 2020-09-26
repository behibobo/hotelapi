class Api::DashboardController < ApplicationController

	def index
			hotels = Hotel.all
			rooms = {
				single: 0,
				double: 0,
				suite: 0
			}
			

			hotels.each do |hotel|
				if hotel.rooms.where(room_type: :single).any?
					rooms[:single] = hotel.rooms.where(room_type: :single).first.count
				end

				if hotel.rooms.where(room_type: :double).any?
					rooms[:double] = hotel.rooms.where(room_type: :double).first.count
				end

				if hotel.rooms.where(room_type: :suite).any?
					rooms[:suite] = hotel.rooms.where(room_type: :suite).first.count
				end
			end
			data = {
				hotels: hotels,
				rooms: rooms
			}
			render json: data
	end
end
