require "rails_helper"
describe ForecastFacade do
  it 'exists' do
    facade = ForecastFacade.new("location")
    expect(facade).to be_a(ForecastFacade)
    expect(facade.location).to eq("location")
    expect(facade.id).to eq(1)
  end

  it '#lat_lon_service returns a lat_lon_service instance' do
    facade = ForecastFacade.new("Denver")
    expect(facade.lat_lon_service).to be_a(LatLonService)
  end

  it '#forecast_service returns a forecast_service instance' do
    facade = ForecastFacade.new("Denver")
    expect(facade.forecast_service).to be_a(ForecastService)
  end

  it '#forecastreturns a forecast instance', :vcr do
    facade = ForecastFacade.new("Denver")
    expect(facade.forecast).to be_a(Forecast)
  end
end
