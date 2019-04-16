require "rails_helper"
describe LatLonService do
  it 'exists' do
    service = LatLonService.new
    expect(service).to be_a(LatLonService)
  end
  it '#get_lat_lon method returns lat and lon for a address' do
    service = LatLonService.new

    expect(service.get_lat_lon("Denver")).to be_a(Hash)
  end

  it '#get_json method returns json object which contains many key value pairs' do
    service = LatLonService.new
    location = "denver"
    response = service.get_json("?address=#{location}&key=#{ENV['GEOCODING_API']}")

    expect(response).to be_a(Hash)
    expect(response[:results].first[:geometry][:location]).to have_key(:lat)
    expect(response[:results].first[:geometry][:location]).to have_key(:lng)
  end
end
