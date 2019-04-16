require 'rails_helper'
describe 'post request to api/v1/sessions', :type => :request do
  it 'with a body having password and email logs user in' do
    WebMock.disable!
    User.create(email: 'whatever@example.com',
                password: "password",
                api_key: "a1234b")

    user_info = { "email": "whatever@example.com",
                  "password": "password",
                }
    post '/api/v1/sessions', params: user_info.to_json, headers: {
    'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'
    }

    result = JSON.parse(response.body)
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(result).to be_a(Hash)
    expect(result).to have_key("api_key")
  end

  it 'with a body having incorrect email can not log in' do
    WebMock.disable!
    User.create(email: 'whatever@example.com',
                password: "password",
                api_key: "a1234b")

    user_info = { "email": "whatever11@example.com",##incorrect
                  "password": "password",
                }
    post '/api/v1/sessions', params: user_info.to_json, headers: {
    'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'
    }

    result = JSON.parse(response.body)
    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(result["error"]).to eq("Not a valid email")
  end

  it 'with a body having incorrect password can not log in' do
    WebMock.disable!
    User.create(email: 'whatever@example.com',
                password: "password",
                api_key: "a1234b")

    user_info = { "email": "whatever@example.com",##incorrect
                  "password": "password123",
                }
    post '/api/v1/sessions', params: user_info.to_json, headers: {
    'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'
    }

    result = JSON.parse(response.body)
    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(result["error"]).to eq("Could not be authenticated!!")
  end
end
