require 'rails_helper'
describe Antipode do
  it 'exists + instance methods' do
    hash = {
      currently: {
        summary: 'this is summary',
        temperature: 50
      }
    }
    antipode = Antipode.new(hash, "location", "location1")
    expect(antipode).to be_a(Antipode)
    expect(antipode.id).to eq (1)
    expect(antipode.location_name).to eq ("location1")
    expect(antipode.search_location).to eq ("location")
    expect(antipode.forecast).to eq({summary: "this is summary",current_temperature:  50})
  end
end
