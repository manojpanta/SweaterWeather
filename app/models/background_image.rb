class BackgroundImage
  attr_reader :id,
              :image_url
  def initialize(url)
    @id = 1
    @image_url = url
  end
end
