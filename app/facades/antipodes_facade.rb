class AntipodesFacade
  include BaseFacade
  def initialize(location)
    @location = location
  end

  def get_amypode_lat_lon
    amypode_service.get_amypode(get_lat_lon)
  end

  def get_amypode_location
    lat_lon_service.get_amypode_location(get_amypode_lat_lon)
  end

  def get_amypode_forecast
    hash = {}
    hash[:lat] =get_amypode_lat_lon[:lat]
    hash[:lng] =get_amypode_lat_lon[:long]
    forecast = forecast_service.get_forecast(hash)
    Antipode.new(forecast, @location, get_amypode_location)
  end

  def get_lat_lon
    lat_lon_service.get_lat_lon(@location)
  end
end
