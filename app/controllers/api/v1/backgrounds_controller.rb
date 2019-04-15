class Api::V1::BackgroundsController < ApplicationController
  def show
    location = params[:location]
    render json: BackgroundsSerializer.new(BackgroundsFacade.new(location).background_image)
  end
end
