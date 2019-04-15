require 'rails_helper'
describe 'post request to api/v1/users' do
  it 'with a body having password and email creates a user' do
    WebMock.disable!
    request =   post "/api/v1/users"
    request.headers['Content-Type'] = 'application/json'
    request.body ={ "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "password"
                  }

    result = JSON.parse(response.body)

    expect(response).to be_successful
    expect(result).to be_a(Hash)
  end
end
