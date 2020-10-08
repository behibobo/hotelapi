class Api::PassengersController < ApplicationController
  before_action :set_passenger, only: [:show, :update, :destroy]

  # GET /passengers
  def index
    if current_user.role == "admin"
      @passengers = Passenger.all
    else
      hotel = Hotel.where(user: params[:current_user])
      rooms_id = hotel.rooms.pluck(:id).flatten
      @passengers = Passenger.where(room_id: rooms_id)
    end
    paginate @passengers, per_page: (params[:per_page]) ? params[:per_page] : 15
  end

  # GET /passengers/1
  def show
    render json: @passenger
  end

  # POST /passengers
  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      render json: @passenger, status: :created
    else
      render json: @passenger.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /passengers/1
  def update
    if @passenger.update(passenger_params)
      render json: @passenger
    else
      render json: @passenger.errors, status: :unprocessable_entity
    end
  end

  # DELETE /passengers/1
  def destroy
    @passenger.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def passenger_params
      params.require(:passenger).permit(:first_name, :last_name, :email, :password_digest, :phone, :nid, :status)
    end
end
