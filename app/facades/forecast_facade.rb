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
    @lat_lon_hash ||= lat_lon_service.get_lat_lon(@location)
    @response ||= forecast_service.get_forecast(@lat_lon_hash)
  end
end
