require "rails_helper"
describe ForecastService do
  it 'exists' do
    service = ForecastService.new
    expect(service).to be_a(ForecastService)
  end
  it '#get_forecast method returns forecast for an address' do
    service = ForecastService.new
    lat_lon = {:lat => 39.7392358, :lng => -104.990251}

    expect(service.get_forecast(lat_lon)).to be_a(Hash)
  end

  it '#get_json method returns json object which contains many key value pairs' do
    service = ForecastService.new
    response = service.get_json(-22.3193039, -65.8306389)

    expect(response).to be_a(Hash)
  end
end
