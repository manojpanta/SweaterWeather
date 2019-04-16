require 'rails_helper'
describe 'delete request to api/v1/favorites', :type => :request do
  it 'with a body having an api key and a location deletes favorite for user' do
    WebMock.disable!
    user = User.create(email: 'whatever@example.com',
                password: "password",
                api_key: "a1234b")

    user.favorites.create(location: 'california')
    user.favorites.create(location: 'denver')
    expect(user.favorites.count).to eq(2)
    params = { "api_key": "a1234b",
                "location": "california"}

    delete '/api/v1/favorites', params: params.to_json, headers: {
    'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'
    }

    result = JSON.parse(response.body)
    binding.pry

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(result).to be_a(Hash)
    expect(result["data"].count).to eq(1)
    expect(result["data"].first["attributes"]).to have_key("location")
    expect(result["data"].first["attributes"]).to have_key("daily_forecast")
    expect(result["data"].first["attributes"]).to have_key("hourly_forecast")
  end
end
