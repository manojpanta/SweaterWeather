require "rails_helper"
describe AntipodesFacade do
  it 'exists' do
    facade = AntipodesFacade.new("hongkong")
    expect(facade).to be_a(AntipodesFacade)
  end

  it '#lat_lon_service returns a lat_lon_service instance' do
    facade = AntipodesFacade.new("hongkong")

    expect(facade.lat_lon_service).to be_a(LatLonService)
  end

  it '#amypode_service returns a amypode_service instance' do
    facade = AntipodesFacade.new("hongkong")

    expect(facade.amypode_service).to be_a(AmypodeService)
  end

  it '#get_lat_lon returns a lat and lon for a location' do
    facade = AntipodesFacade.new("hongkong")

    expect(facade.get_lat_lon).to be_a(Hash)
    expect(facade.get_lat_lon).to have_key(:lat)
    expect(facade.get_lat_lon).to have_key(:lng)
  end

  it '#get_amypode_lat_lon returns a amypode lat lon for a location' do
    facade = AntipodesFacade.new("hongkong")

    expect(facade.get_amypode_lat_lon).to be_a(Hash)
    expect(facade.get_amypode_lat_lon).to have_key(:lat)
    expect(facade.get_amypode_lat_lon).to have_key(:long)
  end

  it '#get_amypode_location returns a amypode location' do
    facade = AntipodesFacade.new("hongkong")

    expect(facade.get_amypode_location).to be_a(String)
  end

  it '#get_amypode_forecast returns a forecast object' do
    facade = AntipodesFacade.new("hongkong")

    expect(facade.get_amypode_forecast).to be_a(Antipode)
    expect(facade.get_amypode_forecast.search_location).to eq("hongkong")
  end
end
