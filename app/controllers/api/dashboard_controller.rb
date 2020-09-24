class Api::DashboardController < ApplicationController

	def index
			hotels = Hotel.all
			data = {
				hotels: hotels
			}
			render json: data
	end
end
