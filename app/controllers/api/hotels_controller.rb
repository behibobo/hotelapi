class Api::HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :update, :destroy]

  # GET /hotels
  def index
    if current_user.role == "admin"
      @hotels = Hotel.all
    else
      @hotels = Hotel.where(user: current_user)
    end
    render json: @hotels
  end

  # GET /hotels/1
  def show
    render json: @hotel
  end

  # POST /hotels
  def create
    unless current_user.role == "admin"
      render json: {error: ""}, status: :unauthorized
      return 
    end

    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      params[:facilities].each do |facility|
        HotelFacility.create!(hotel: @hotel, facility_id: facility)
      end

      render json: @hotel, status: :created
    else
      render json: @hotel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hotels/1
  def update
    unless current_user.role == "admin" || current_user == @hotel.user
      render json: {error: ""}, status: :unauthorized
      return 
    end

    if @hotel.update(hotel_params)
      @hotel.hotel_facilities.destroy_all()

      params[:facilities].each do |facility|
        HotelFacility.create!(hotel: @hotel, facility_id: facility)
      end

      render json: @hotel
    else
      render json: @hotel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hotels/1
  def destroy
    @hotel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hotel_params
      params.require(:hotel).permit(:name, :address, :city_id, :lat, :lng, :rank)
    end
end
