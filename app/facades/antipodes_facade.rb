class AntipodesFacade
  attr_reader :location, :id

  def initialize(location)
    @location = location
    @id = 1
  end

  def amypode_service
    AmypodeService.new
  end

  def get_lat_lon
    lat_lon_service.get_lat_lon(@location)
  end

  def lat_lon_service
    LatLonService.new
  end
end
