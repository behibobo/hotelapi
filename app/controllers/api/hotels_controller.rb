class Api::HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :update, :destroy]

  # GET /hotels
  def index
    if current_user.role == "admin"
      @hotels = Hotel.all
      @hotels = @hotels.where(category: params[:category]) if params[:category]
      if params[:province_id]
        city_ids = City.where(province_id: params[:province_id]).pluck(:id).flatten
        @hotels = @hotels.where(city_id: city_ids)
      end

      @hotels = @hotels.starts_with(name, params[:name]) if params[:name]
      @hotels = @hotels.where(rank: params[:rank]) if params[:rank]
      paginate @hotels, per_page: (params[:per_page]) ? params[:per_page] : 15
    else
      @hotel = Hotel.where(user: current_user).first
      render json: @hotel
    end
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
      
      if params[:facilities]
        params[:facilities].each do |facility|
          HotelFacility.create!(hotel: @hotel, facility_id: facility)
        end
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

      if params[:facilities]
        params[:facilities].each do |facility|
          HotelFacility.create!(hotel: @hotel, facility_id: facility)
        end
      end

      render json: @hotel
    else
      render json: @hotel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hotels/1
  def destroy
    if @hotel.rooms.any?
      render json: "has rooms", status: :unprocessable_entity
    end
    @hotel.destroy
  end

  def images
    images = Image.where(imageable_type: "Hotel", imageable_id: params[:id])
    render json: images
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hotel_params
      params.require(:hotel).permit(:name, :address, :transfer, :category, :city_id, :user_id, :lat, :lng, :rank)
    end
end
