class LatLonService
  def get_lat_lon(loc, url='')
    if image = BackgroundImage.find_by(location: loc.downcase)
      {:lat=> image.lat, :lng=> image.lon}
    else
      a = get_json(loc)
      BackgroundImage.create(location: loc, lat: a[:lat], lon: a[:lng], image_url: url)
      a
    end
    # get_json(location)
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
