require 'rails_helper'
describe 'request to /api/v1/forecast with' do
  it 'address params returns forcast for the location' do
    location = "Denver"

    get "/api/v1/forecast?location=#{location}"

    result = JSON.parse(response.body)

    expect(response).to be_successful
    expect(result).to have_key("data")
  end
end
