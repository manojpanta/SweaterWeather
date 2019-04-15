require "rails_helper"
describe BackgroundService do
  it 'exists' do
    service = BackgroundService.new
    expect(service).to be_a(BackgroundService)
  end

  it '#get_background_image method returns response', :vcr do
    location ="denver"
    service = BackgroundService.new
    expect(service.get_background_image(location)).to be_a(String)
  end
end
