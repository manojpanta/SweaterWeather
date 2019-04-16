module BaseService
  def background_service
    BackgroundService.new
  end

  def lat_lon_service
    LatLonService.new
  end

  def forecast_service
    ForecastService.new
  end
end
