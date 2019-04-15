require 'faraday'
class LatLonService
  def get_lat_lon(location)
    get_json(location)
  end

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
