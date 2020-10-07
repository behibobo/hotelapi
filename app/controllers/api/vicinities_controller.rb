class Api::VicinitiesController < ApplicationController
  before_action :set_vicinity, only: [:show, :update, :destroy]

  # GET /vicinities
  def index
    @vicinities = Vicinity.all

    render json: @vicinities
  end

  # GET /vicinities/1
  def show
    render json: @vicinity
  end

  # POST /vicinities
  def create
    @vicinity = Vicinity.new(vicinity_params)

    if @vicinity.save
      render json: @vicinity, status: :created
    else
      render json: @vicinity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vicinities/1
  def update
    if @vicinity.update(vicinity_params)
      render json: @vicinity
    else
      render json: @vicinity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vicinities/1
  def destroy
    @vicinity.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vicinity
      @vicinity = Vicinity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vicinity_params
      params.require(:vicinity).permit(:name, :hotel_id)
    end
end
