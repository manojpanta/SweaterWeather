class ForecastFacade
  include BaseService
  attr_reader :location, :id
  def initialize(location)
    @location = location
    @id = 1
  end

  def forecast
    if weather = Weather.find_by(location: @location.downcase)
      Forecast.new(JSON.parse(weather.weather_data, symbolize_names: true))
    else
      Forecast.new(service_response)
    end
  end

  def service_response
    lat_lon_hash = lat_lon_service.get_lat_lon(@location)
    forecast_service.get_forecast(lat_lon_hash)
  end
end
