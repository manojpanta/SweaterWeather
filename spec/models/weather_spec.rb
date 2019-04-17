require 'rails_helper'
describe Weather do
  it '#methods' do
    weather = Weather.create(location: 'location', weather_data: "data")

    expect(weather.location).to eq("location")
    expect(weather.weather_data).to eq("data")
  end
end
