require 'rails_helper'
describe 'post request to api/v1/favorites', :type => :request do
  it 'with a body having api_key and location name can favorite places' do
    WebMock.disable!
    user = User.create(email: 'manoj', password: 'this', api_key:'abchb')

    body = { "location": "Denver",
             "api_key": "abchb"
            }
    post '/api/v1/favorites', params: body.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    result = JSON.parse(response.body)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(result).to be_a(Hash)
    expect(result).to have_key("success")
    expect(user.favorites.last.location).to eq("Denver")
  end
end
