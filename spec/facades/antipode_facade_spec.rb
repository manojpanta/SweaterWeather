require "rails_helper"
describe AntipodesFacade do
  it 'exists' do
    facade = AntipodesFacade.new("location")
    expect(facade).to be_a(AntipodesFacade)
  end

  it '#lat_lon_service returns a lat_lon_service instance' do
    facade = AntipodesFacade.new("Denver")

    expect(facade.lat_lon_service).to be_a(LatLonService)
  end

  it '#amypode_service returns a amypode_service instance' do
    facade = AntipodesFacade.new("Denver")

    expect(facade.amypode_service).to be_a(AmypodeService)
  end

  it '#get_lat_lon returns a lat and lon for a location' do
    facade = AntipodesFacade.new("Denver")

    expect(facade.get_lat_lon).to be_a(Hash)
    expect(facade.get_lat_lon).to have_key(:lat)
    expect(facade.get_lat_lon).to have_key(:lng)
  end
end
