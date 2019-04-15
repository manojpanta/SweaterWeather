class Api::V1::AntipodesController < ApplicationController
  def show
    location = params[:loc]
    render json: AntipodesSerializer.new(AntipodesFacade.new(location).get_amypode_forecast)
  end
end
