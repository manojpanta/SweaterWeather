require "rails_helper"
describe AmypodeService do
  it 'exists' do
    service = AmypodeService.new
    expect(service).to be_a(AmypodeService)
  end
end
