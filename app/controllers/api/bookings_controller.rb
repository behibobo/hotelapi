class Api::BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]

  # GET /bookings
  def index
    @bookings = Booking.all
    @bookings = @bookings.where(room_id: params[:room_id]) if params[:room_id]

    if params[:hotel_id]
      room_ids = Room.where(hotel_id: params[:hotel_id]).pluck(:id).flatten
      @bookings = @bookings.where(room_id: room_ids)
    end
    paginate @bookings, per_page: (params[:per_page]) ? params[:per_page] : 15
  end

  # GET /bookings/1
  def show
    render json: @booking
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      render json: @booking, status: :created, location: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def booking_params
      params.require(:booking).permit(:room_id, :passenger_id, :check_in_date, :check_out_date, :book_date, :status)
    end
end
