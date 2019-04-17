class LatLonService
  def get_lat_lon(location)
    if image = BackgroundImage.find_by(location: location.downcase)
      {:lat=> image.lat, :lng=> image.lon}
    else
      a = get_json(location)
      BackgroundImage.create(location: location, lat: a[:lat], lon: a[:lng])
      a
    end
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
