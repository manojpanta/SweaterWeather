require "rails_helper"
describe AmypodeService do
  it 'exists' do
    service = AmypodeService.new
    expect(service).to be_a(AmypodeService)
  end

  it '#get_amypode method returns a hash' do
    service = AmypodeService.new
    hash = {:lat=>22.3193039, :lng=>114.1693611}
    expect(service.get_amypode(hash)).to be_a(Hash)
    expect(service.get_amypode(hash)).to have_key(:lat)
    expect(service.get_amypode(hash)).to have_key(:long)
  end
end
