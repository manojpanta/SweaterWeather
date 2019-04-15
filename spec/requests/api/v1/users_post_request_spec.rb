require 'rails_helper'
describe 'post request to api/v1/users', :type => :request do
  it 'with a body having password and email creates a user' do
    WebMock.disable!
    user_info = { "email": "whatever@example.com",
                  "password": "password",
                  "password_confirmation": "password"
                }
    post '/api/v1/users', params: user_info.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }



    result = JSON.parse(response.body)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(result).to be_a(Hash)
    expect(result).to have_key("api_key")
  end
end
