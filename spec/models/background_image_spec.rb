require 'rails_helper'
describe BackgroundImage do
  it 'exists' do
    image = BackgroundImage.new
    expect(image).to be_a(BackgroundImage)
  end

  it '#instance methods' do
    image = BackgroundImage.new(location: 'location',
                                image_url: 'url',
                                lat: 33.44,
                                lon: 33.3)
    expect(image.location).to eq("location")
    expect(image.image_url).to eq("url")
    expect(image.lat).to eq(33.44)
    expect(image.lon).to eq(33.3)
  end
end
