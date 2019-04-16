class ForecastFacade
  include BaseService
  attr_reader :location, :id
  def initialize(location)
    @location = location
    @id = 1
  end

  def forecast
    Forecast.new(service_response)
  end

  def service_response
    if location = BackgroundImage.find_by(location: @location)
      hash = {}
      hash[:lat] = location.lat
      hash[:lng] = location.lon
      hash
    else
      hash = lat_lon_service.get_lat_lon(@location)
    end
    @response ||= forecast_service.get_forecast(hash)
  end
end
