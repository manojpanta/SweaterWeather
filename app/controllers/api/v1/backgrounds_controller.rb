class Api::V1::BackgroundsController < ApplicationController
  def show
    location = params[:location]
    if background_image = BackgroundImage.find_by(location: location.downcase)
      render json: BackgroundsSerializer.new(background_image)
    else
      render json: BackgroundsSerializer.new(BackgroundsFacade.new(location).background_image)
    end
  end
end
