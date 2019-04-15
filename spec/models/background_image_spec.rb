require 'rails_helper'
describe BackgroundImage do
  it 'exists' do
    image = BackgroundImage.new({}, "location")
    expect(image).to be_a(BackgroundImage)
  end

  it '#instance methods' do
    image = BackgroundImage.new({}, "location")
    expect(image.location).to eq("location")
  end
end
