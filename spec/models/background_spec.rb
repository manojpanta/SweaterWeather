require 'rails_helper'
describe BackgroundImage do
  it 'exists' do
    image = BackgroundImage.new("url", "location")
    expect(image).to be_a(BackgroundImage)
  end
end
