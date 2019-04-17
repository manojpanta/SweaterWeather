require "rails_helper"
describe FavoritesFacade do
  it 'exists' do
    user = User.create(email: 'this user', password: 'password')
    facade = FavoritesFacade.new(user)
    expect(facade).to be_a(FavoritesFacade)
    expect(facade.id).to eq(1)
  end

  it '#favorites method returns favorites for a user', :vcr do
    user = User.create(email: 'this user', password: 'password')
    user.favorites.create(location: 'denver')
    user.favorites.create(location: 'denver')
    user.favorites.create(location: 'denver')
    facade = FavoritesFacade.new(user)


    expect(facade.favorites).to be_a(Array)
    expect(facade.favorites[0]).to be_a(Forecast)
  end

  it '#service_response method returns a hash with weather data', :vcr do
    location = 'denver'
    user = User.create(email: 'this user', password: 'password')
    facade = FavoritesFacade.new(user)


    expect(facade.service_response(location)).to be_a(Hash)
  end
end
