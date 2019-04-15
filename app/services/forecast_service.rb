class ForecastService
  def get_forecast(lat_lon)
    get_json(lat_lon[:lat], lat_lon[:lng])
  end


  def get_json(lat,lon)
    response = conn(lat,lon)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(lat, lon)
    Faraday.get("https://api.darksky.net/forecast/#{ENV["DARK-SKY-API-KEY"]}/#{lat},#{lon}")
  end
end
