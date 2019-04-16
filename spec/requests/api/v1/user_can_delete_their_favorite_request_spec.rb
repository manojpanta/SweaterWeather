require 'rails_helper'
describe 'delete request to api/v1/favorites', :type => :request do
  it 'with a body having an api key and a location deletes favorite for user', :vcr do
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

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(result).to be_a(Hash)
    expect(user.favorites.count).to eq(1)
    expect(result["data"].count).to eq(1)
    expect(result["data"].first["attributes"]).to have_key("location")
    expect(result["data"].first["attributes"]).to have_key("daily_forecast")
    expect(result["data"].first["attributes"]).to have_key("hourly_forecast")
  end

  it 'with invlaid api key and a location can not delete favorite for user' do
    user = User.create(email: 'whatever@example.com',
                       password: "password",
                       api_key: "a1234b")

    user.favorites.create(location: 'california')
    user.favorites.create(location: 'denver')
    expect(user.favorites.count).to eq(2)
    params = { "api_key": "a1234bjchbdsj",##invalid
               "location": "california"}

    delete '/api/v1/favorites', params: params.to_json, headers: {
    'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'
    }

    result = JSON.parse(response.body)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(result["error"]).to eq("Invalid API Key")
    expect(user.favorites.count).to eq(2)##still 2
  end
end
