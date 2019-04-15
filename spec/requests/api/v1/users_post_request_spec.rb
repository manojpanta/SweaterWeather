require 'uri'
require 'net/http'
require 'rails_helper'
describe 'post request to api/v1/users', :type => :request do
  it 'with a body having password and email creates a user' do
    WebMock.disable!
    header = {"Content-Type": "multipart/form-data", "Accept": "application/json"}
    user_info = { "email": "whatever@example.com",
                  "password": "password",
                  "password_confirmation": "password"
                }
    # post '/api/v1/users', { id: 777}.to_json, format: :json

    post '/api/v1/users', params: user_info.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }



    result = JSON.parse(response.body)

    expect(response).to be_successful
    expect(result).to be_a(Hash)
  end
end
