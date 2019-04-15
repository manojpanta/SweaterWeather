class BackgroundsFacade
  def initialize(location)
    @location = location
  end

  def background_image
    url = service.get_background_image(@location)
    BackgroundImage.new(url, @location)
  end
  
  def service
    BackgroundService.new
  end
end
