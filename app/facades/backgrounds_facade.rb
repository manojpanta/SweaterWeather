class BackgroundsFacade
  include BaseService
  def initialize(location)
    @location = location
  end

  def background_image
    url = background_service.get_background_image(@location)
    while url== "" || url == nil || url == "null"
      url = background_service.get_background_image(@location)
    end
    result = lat_lon_service.get_lat_lon(@location)
    BackgroundImage.create(image_url: url, location: @location.downcase, lat: result[:lat], lon: result[:lng])
  end
end
