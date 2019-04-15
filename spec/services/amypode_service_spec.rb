require "rails_helper"
describe AmypodeService do
  it 'exists' do
    service = AmypodeService.new
    expect(service).to be_a(AmypodeService)
  end

  it '#get_amypode method returns a hash' do
    service = AmypodeService.new
    expect(service.get_amypode({})).to be_a(Hash)
  end

  it '#get_amypode_location method returns a string' do
    service = AmypodeService.new
    expect(service.get_amypode_location).to be_a(String)
  end
end
