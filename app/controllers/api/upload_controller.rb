class Api::UploadController < ApplicationController
  def create
    
    if (params[:type] == "hotel")
      @resource = Hotel.find(params[:id])
    end

    @image = @resource.images.build(name: params[:file])
    @image.save
		render json: {data: @image.name }
  end
end
