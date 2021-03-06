class Api::RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]

  # GET /rooms
  def index
    @rooms = Room.all
    @rooms = @rooms.where(hotel_id: params[:hotel_id]) if params[:hotel_id]
    paginate @rooms, per_page: (params[:per_page]) ? params[:per_page] : 15
  end

  # GET /rooms/1
  def show
    render json: @room
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      if params[:facilities]
        params[:facilities].each do |facility|
          RoomFacility.create!(room: @room, facility_id: facility)
        end
      end

      render json: @room, status: :created
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params)

      @room.room_facilities.destroy_all()

      if params[:facilities]
        params[:facilities].each do |facility|
          RoomFacility.create!(room: @room, facility_id: facility)
        end
      end

      render json: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
  end

  def images
    images = Image.where(imageable_type: "Hotel", imageable_id: params[:id])
    render json: images
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def room_params
      params.require(:room).permit(:number, :hotel_id, :room_type_id, :check_in_hour, :check_out_hour)
    end
end
