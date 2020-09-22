class Api::CitiesController < ApplicationController

	def province
		@province = Province.where('name LIKE ?', "%#{params[:q]}%")
		render json: @province
	end


	def city
		@city = City
		.where(province_id: params[:province_id])	
		.where('name LIKE ?', "%#{params[:q]}%")
		render json: @city
	end
end
