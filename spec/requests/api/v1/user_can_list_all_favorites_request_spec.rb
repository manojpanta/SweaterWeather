require 'rails_helper'
describe 'get request to api/v1/favorites', :type => :request do
  it 'with a body having an api key can list favorites of apikey user' do
    WebMock.disable!
    user = User.create(email: 'whatever@example.com',
                password: "password",
                api_key: "a1234b")

    user.favorites.create(location: 'california')

    params = { "api_key": "a1234b" }
    get '/api/v1/favorites', params: params, headers: {
    'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'
    }

    result = JSON.parse(response.body)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(result).to be_a(Hash)
    expect(result["data"].first["attributes"]).to have_key("location")
    expect(result["data"].first["attributes"]).to have_key("daily_forecast")
    expect(result["data"].first["attributes"]).to have_key("hourly_forecast")
  end
end
