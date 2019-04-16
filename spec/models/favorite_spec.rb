require 'rails_helper'
describe Favorite do
  describe 'validations' do
    it { should belong_to(:user) }
  end
end
