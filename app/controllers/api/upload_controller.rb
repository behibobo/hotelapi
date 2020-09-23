class Api::UploadController < ApplicationController
  
  def create
    if (params[:type] == "hotel")
      @resource = Hotel.find(params[:id])
    else
      @resource = Room.find(params[:id])
    end

    params[:files].each do |file|
      @image = @resource.images.build(name: file)
      @image.save
    end
    
		render json: {data: @image.images }
  end

end
