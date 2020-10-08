class Api::FacilitiesController < ApplicationController
  before_action :set_facility, only: [:show, :update, :destroy]

  # GET /facilities
  def index
    @facilities = Facility.all
    @facilities = @facilities.where(facility_type: params[:facility_type]) if params[facility_type]
    paginate @facilities, per_page: (params[:per_page]) ? params[:per_page] : 15
  end

  # GET /facilities/1
  def show
    render json: @facility
  end

  # POST /facilities
  def create
    @facility = Facility.new(facility_params)

    if @facility.save
      render json: @facility, status: :created
    else
      render json: @facility.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /facilities/1
  def update
    if @facility.update(facility_params)
      render json: @facility
    else
      render json: @facility.errors, status: :unprocessable_entity
    end
  end

  # DELETE /facilities/1
  def destroy
    @facility.destroy
  end
  

  def all
    @facilities = Facility.all
    render json: @facilities
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facility
      @facility = Facility.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def facility_params
      params.require(:facility).permit(:name, :facility_type)
    end
end
