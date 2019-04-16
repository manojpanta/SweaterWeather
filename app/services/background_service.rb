class BackgroundService
  def get_background_image(location)
    get_json(location)[:photos][:photo].shuffle[0][:url_l]
  end

  def get_json(location)
    response = conn(location)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(location)
    Faraday.get("https://api.flickr.com/services/rest") do |faraday|
      faraday.params["api_key"] = ENV['FLICKR-KEY']
      faraday.params["tags"] = location
      faraday.params["accuracy"] = "11"
      faraday.params["per_page"] = "10"
      faraday.params["method"] = "flickr.photos.search"
      faraday.params["content_type"] = "1"
      faraday.params["format"] = 'json'
      faraday.params["extras"] = 'url_l'
      faraday.params["media"] = 'photos'
      faraday.params["nojsoncallback"] = "true"
    end
  end
end
