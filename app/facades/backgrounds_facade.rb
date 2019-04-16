class BackgroundsFacade
  include BaseService
  def initialize(location)
    @location = location
  end

  def background_image
    url = background_service.get_background_image(@location)
    BackgroundImage.create(image_url: url, location: @location.downcase)
  end
end
