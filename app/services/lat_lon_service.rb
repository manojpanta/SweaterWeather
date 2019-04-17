class LatLonService
  def get_lat_lon(location)
    image  = BackgroundImage.find_or_create_by(location: location.downcase) do |i|
      json = get_json(location)
      i.lat = json[:lat]
      i.lon = json[:lng]
    end
    {:lat=> image.lat, :lng=> image.lon}
  end
  
  private

  def get_json(location)
    response = conn(location)
    JSON.parse(response.body, symbolize_names: true)[:results].first[:geometry][:location]
  end

  def conn(location)
    Faraday.get('https://maps.googleapis.com/maps/api/geocode/json') do |faraday|
      faraday.params['address'] = location
      faraday.params['key'] = ENV['GEOCODING_API']
    end
  end
end
