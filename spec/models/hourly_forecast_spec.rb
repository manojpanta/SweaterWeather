require 'rails_helper'
describe HourlyForecast do
  before :each do
    @data = {:time=>1555362000,
             :summary=>"Mostly Cloudy",
             :icon=>"partly-cloudy-day",
             :precipIntensity=>0,
             :precipProbability=>0,
             :temperature=>73.48,
             :apparentTemperature=>73.48,
             :dewPoint=>22.46,
             :humidity=>0.15,
             :pressure=>1001.52,
             :windSpeed=>2.99,
             :windGust=>9.97,
             :windBearing=>340,
             :cloudCover=>0.83,
             :uvIndex=>4,
             :visibility=>5.59,
             :ozone=>328.17}
  end
  it 'exists' do
    forecast = HourlyForecast.new(@data)
    expect(forecast).to be_a(HourlyForecast)
  end
  it '#instance methods' do
   forecast = HourlyForecast.new(@data)
   expect(forecast.id).to eq(1)
   expect(forecast.time).to eq("03 PM")
   expect(forecast.icon).to eq("partly-cloudy-day")
   expect(forecast.temperature).to eq(73)
  end
end
