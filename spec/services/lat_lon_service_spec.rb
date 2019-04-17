require "rails_helper"
describe LatLonService do
  it 'exists' do
    service = LatLonService.new
    expect(service).to be_a(LatLonService)
  end
  it '#get_lat_lon method returns lat and lon for a address', :vcr do
    service = LatLonService.new

    expect(service.get_lat_lon("Denver")).to be_a(Hash)
    expect(BackgroundImage.count).to eq(1)##testing it creates resource if not in db
  end

  # it '#get_json method returns json object which contains many key value pairs', :vcr do
  #   service = LatLonService.new
  #   response = service.get_json("Denver")
  #
  #   expect(response).to be_a(Hash)
  #   expect(response).to have_key(:lat)
  #   expect(response).to have_key(:lng)
  # end

  it '#get_lat_lon method does not make an api call if already in db'do
  ##webmock not disabled , working without wifi
    service = LatLonService.new
    BackgroundImage.create(location: 'denver', lat: 0.723, lon: -365.8)
    response = service.get_lat_lon("denver")

    expect(response).to be_a(Hash)
    expect(response[:lat]).to eq(0.723)
    expect(response[:lng]).to eq(-365.8)
  end
end
