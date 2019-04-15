require "rails_helper"
describe BackgroundsFacade do
  it 'exists' do
    facade = BackgroundsFacade.new("location")
    expect(facade).to be_a(BackgroundsFacade)
  end

  it 'service method returns background service' do
    facade = BackgroundsFacade.new("location")
    expect(facade.service ).to be_a(BackgroundService)
  end

  it '#background_image method returns background_image' do
    facade = BackgroundsFacade.new("location")
    expect(facade.background_image).to be_a(BackgroundImage)
  end
end
