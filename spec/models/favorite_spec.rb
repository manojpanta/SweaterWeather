require 'rails_helper'
describe Favorite do
  describe 'validations' do
    it { should belong_to(:user) }
  end
  it 'methods' do
    user = User.create(email:'kndk', password: "b djs")
    fav = Favorite.create(user: user, location: 'location')

    expect(fav.user).to eq(user)
    expect(fav.location).to eq("location")
  end
end
