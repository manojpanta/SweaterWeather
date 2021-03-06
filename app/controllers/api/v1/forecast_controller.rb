class Api::V1::ForecastController < ApplicationController
  def show
    location = params[:location]
    render json: ForecastSerializer.new(ForecastFacade.new(location).forecast)
  end
end
