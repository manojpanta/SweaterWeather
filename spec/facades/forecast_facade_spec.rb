require "rails_helper"
describe ForecastFacade do
  it 'exists' do
    facade = ForecastFacade.new("location")
    expect(facade).to be_a(ForecastFacade)
  end
  it '#current_temperature method returns current temperature' do
    facade = ForecastFacade.new("Denver")

    expect(facade.current_temperature).to be_a(Float)
  end

  it '#lat_lon_service returns a lat_lon_service instance' do
    facade = ForecastFacade.new("Denver")

    expect(facade.lat_lon_service).to be_a(LatLonService)
  end
end
