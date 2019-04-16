class FavoritesFacade
  attr_reader :id
  def initialize(user)
    @user = user
    @id = 1
  end

  def favorites
    @user.favorites.map do |location|
      Forecast.new(service_response(location.location))
    end
  end



  def service_response(location)
    @lat_lon = lat_lon_service.get_lat_lon(location)
    @response = forecast_service.get_forecast(@lat_lon)
  end

  def lat_lon_service
    LatLonService.new
  end

  def forecast_service
    ForecastService.new
  end
end
