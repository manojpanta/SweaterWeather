require 'rails_helper'
describe User do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).with_message("Email Already Taken") }
    it { should validate_presence_of(:password) }
    it { should have_many(:favorites) }
  end
  it '#methods' do
    user = User.create(email: 'user', password: "tgiuhis i", api_key: "jhdsbj")

    expect(user.email).to eq("user")
    expect(user.password).to eq("tgiuhis i")
    expect(user.api_key).to eq("jhdsbj")
  end
end
