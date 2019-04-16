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

describe 'post request to api/v1/users', :type => :request do
  it 'with a body that has already used email can not create an account' do
    WebMock.disable!
    User.create(email: 'whatever@example.com', password: 'anbkj')

    user_info = { "email": "whatever@example.com",
                  "password": "password",
                  "password_confirmation": "password"
                }
    post '/api/v1/users', params: user_info.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }



    result = JSON.parse(response.body)

    expect(response).to_not be_successful
    expect(response.status).to eq(404)
    expect(result["error"]["email"].first).to eq("Email Already Taken")
    expect(User.count).to be(1)##just the first one 
  end
  it 'with a body that has unmatching password can not create an account' do
    WebMock.disable!
    user_info = { "email": "whatever@example.com",
                  "password": "password1",
                  "password_confirmation": "password"
                }
    post '/api/v1/users', params: user_info.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }



    result = JSON.parse(response.body)

    expect(response).to_not be_successful
    expect(response.status).to eq(404)
    expect(result["error"]).to eq("Your passwords did not match")
    expect(User.count).to be(0)
  end
end
