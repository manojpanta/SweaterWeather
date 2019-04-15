class Api::V1::AntipodesController < ApplicationController
  def show
    binding.pry
    location = params[:loc]
    render json: AntipodesSerializer.new(AntipodesFacade.new(location).get_amypode_location)
  end
end
