class BackgroundsFacade
  include BaseFacade
  def initialize(location)
    @location = location
  end

  def background_image
    url = background_service.get_background_image(@location)
    BackgroundImage.new(url, @location)
  end
end
