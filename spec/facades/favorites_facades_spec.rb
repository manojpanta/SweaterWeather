require "rails_helper"
describe FavoritesFacade do
  it 'exists' do
    user = User.create(email: 'this user', password: 'password')
    facade = FavoritesFacade.new(user)
    expect(facade).to be_a(FavoritesFacade)
  end
end
