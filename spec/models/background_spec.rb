require 'rails_helper'
describe BackgroundImage do
  it 'exists' do
    image = BackgroundImage.new({})
    expect(image).to be_a(BackgroundImage)
  end
end
