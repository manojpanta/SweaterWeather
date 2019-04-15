class AmypodeService
  
  def get_amypode(lat_lon_hash)
    get_json(lat_lon_hash[:lat], lat_lon_hash[:lng])[:data][:attributes]
  end

  def get_json(lat, lon)
    response = conn(lat, lon)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(lat, lon)
    Faraday.get('http://amypode.herokuapp.com/api/v1/antipodes') do |faraday|
      faraday.headers['api_key'] = ENV['AMYPODE-API']
      faraday.params['lat'] = lat
      faraday.params['long'] = lon
    end
  end
end
