module BaseFacade
  def amypode_service
    AmypodeService.new
  end

  def lat_lon_service
    LatLonService.new
  end

  def forecast_service
    ForecastService.new
  end

  def background_service
    BackgroundService.new
  end
end
