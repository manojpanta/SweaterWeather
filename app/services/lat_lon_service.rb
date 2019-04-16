require 'faraday'
class LatLonService

  def get_lat_lon(location)
    get_json("?address=#{location}&key=#{ENV['GEOCODING_API']}")[:results].first[:geometry][:location]
  end

  def get_amypode_location(lat_lon_hash)
    get_json("?latlng=#{lat_lon_hash[:lat]},#{lat_lon_hash[:long]}&key=#{ENV['GEOCODING_API']}")[:results].first[:formatted_address]
  end

  def get_json(params)
    response = conn.get(params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/json') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  # def get_amypode_json(lat, lon)
  #   response = amypode_conn(lat,lon)
  #   JSON.parse(response.body, symbolize_names: true)
  # end


  # def amypode_conn(lat,lon)
  #   Faraday.get('https://maps.googleapis.com/maps/api/geocode/json') do |faraday|
  #     faraday.params['latlng'] = "#{lat},#{lon}"
  #     faraday.params['key'] = ENV['GEOCODING_API']
  #   end
  # end
end
