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

  it '#get_json method returns a hash' do
    service = AmypodeService.new
    lat = 22.3193039
    lon = 114.1693611
    expect(service.get_json(lat, lon)).to be_a(Hash)
    expect(service.get_json(lat, lon)).to have_key(:data)
    expect(service.get_json(lat, lon)[:data]).to have_key(:attributes)
  end
end
