require 'rails_helper'
describe DailyForecast do
  before :each do
    @data = { :time=>1555308000,
         :summary=>"Mostly cloudy throughout the day.",
         :icon=>"partly-cloudy-day",
         :sunriseTime=>1555331002,
         :sunsetTime=>1555378721,
         :moonPhase=>0.37,
         :precipIntensity=>0.0003,
         :precipIntensityMax=>0.0037,
         :precipIntensityMaxTime=>1555365600,
         :precipProbability=>0.02,
         :precipType=>"rain",
         :temperatureHigh=>74.45,
         :temperatureHighTime=>1555365600,
         :temperatureLow=>44.97,
         :temperatureLowTime=>1555416000,
         :apparentTemperatureHigh=>74.45,
         :apparentTemperatureHighTime=>1555365600,
         :apparentTemperatureLow=>42.95,
         :apparentTemperatureLowTime=>1555416000,
         :dewPoint=>26.11,
         :humidity=>0.28,
         :pressure=>1002.76,
         :windSpeed=>1.15,
         :windGust=>10.32,
         :windGustTime=>1555372800,
         :windBearing=>185,
         :cloudCover=>0.57,
         :uvIndex=>5,
         :uvIndexTime=>1555351200,
         :visibility=>6.52,
         :ozone=>328.06,
         :temperatureMin=>47.35,
         :temperatureMinTime=>1555326000,
         :temperatureMax=>74.45,
         :temperatureMaxTime=>1555365600,
         :apparentTemperatureMin=>46.34,
         :apparentTemperatureMinTime=>1555326000,
         :apparentTemperatureMax=>74.45,
         :apparentTemperatureMaxTime=>1555365600}
  end
  it 'exists' do
    forecast = DailyForecast.new(@data)
    expect(forecast).to be_a(DailyForecast)
  end
  it '#instance methods' do
   forecast = DailyForecast.new(@data)
   expect(forecast.date).to eq("Monday")
   expect(forecast.summary).to eq("Mostly cloudy throughout the day.")
   expect(forecast.icon).to eq("partly-cloudy-day")
   expect(forecast.high).to eq(74.45)
   expect(forecast.low).to eq(44.97)
   expect(forecast.humidity).to eq("28%")
  end
end
