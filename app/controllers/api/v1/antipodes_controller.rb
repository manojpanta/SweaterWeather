class Api::V1::AntipodesController < ApplicationController
  def show
    location = params[:location]
    render json: AntipodesSerializer.new(AntipodesFacade.new(location))
  end
end
