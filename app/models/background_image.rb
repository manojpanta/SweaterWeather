class BackgroundImage
  attr_reader :id,
              :image_url,
              :location
  def initialize(url, location)
    @id = 1
    @image_url = url
    @location = location
  end
end
