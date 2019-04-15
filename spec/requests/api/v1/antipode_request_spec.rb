require 'rails_helper'
describe 'request to /api/v1/antipode with' do
  it 'location params returns lat and lon for location' do
    location = "hongkong"

    get "/api/v1/antipode?loc=#{location}"

    result = JSON.parse(response.body)

    expect(response).to be_successful
    expect(result).to be_a(Hash)
    expect(result).to have_key("data")
    expect(result["data"]).to have_key("attributes")
    expect(result["data"]["attributes"]).to have_key("location_name")
    expect(result["data"]["attributes"]).to have_key("forecast")
    expect(result["data"]["attributes"]).to have_key("search_location")
    expect(result["data"]["attributes"]["forecast"]).to have_key("summary")
    expect(result["data"]["attributes"]["forecast"]).to have_key("current_temperature")
  end
end
