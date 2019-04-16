require 'rails_helper'
describe 'request to /api/v1/backgrounds with' do
  it 'address params returns background image', :vcr do
    location = "Denver"

    get "/api/v1/backgrounds?location=#{location}"

    result = JSON.parse(response.body)

    expect(response).to be_successful
    expect(result).to be_a(Hash)
    expect(result["data"]["attributes"]).to have_key("id")
    expect(result["data"]["attributes"]).to have_key("image_url")
    expect(result["data"]["attributes"]).to have_key("location")
  end
  it 'address params returns background image url if in db without api call' do
    ##webmock is not disabled here && works without wifi
    location = "denver"
    image = BackgroundImage.create(image_url: 'abc', location: "#{location}")
    get "/api/v1/backgrounds?location=#{location}"

    result = JSON.parse(response.body)

    expect(response).to be_successful
    expect(result["data"]["attributes"]["image_url"]).to eq("abc")
  end
end
