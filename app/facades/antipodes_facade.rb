class AntipodesFacade
  attr_reader :location, :id

  def initialize(location)
    @location = location
    @id = 1
  end


  def get_amypode
    amypode_service.get_amypode(get_lat_lon)
  end

  def get_amypode_forecast
    hash = {}
    hash[:lat] =get_amypode[:lat]
    hash[:lng] =get_amypode[:long]
    forecast = forecast_service.get_forecast(hash)
    Antipode.new(forecast, @location, get_amypode_location)
  end

  def get_amypode_location
    lat_lon_service.get_amypode_location(get_amypode)
  end

  def get_lat_lon
    lat_lon_service.get_lat_lon(@location)
  end

  def amypode_service
    AmypodeService.new
  end

  def lat_lon_service
    LatLonService.new
  end

  def forecast_service
    ForecastService.new
  end
end
