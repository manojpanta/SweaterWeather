require 'rails_helper'
describe 'request to /api/v1/backgrounds with' do
  it 'address params returns background image', :vcr do
    location = "Denver"

    get "/api/v1/backgrounds?location=#{location}"

    result = JSON.parse(response.body)

    expect(response).to be_successful
    expect(result).to be_a(Hash)
  end
end
