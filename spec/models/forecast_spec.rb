require 'rails_helper'
describe Forecast do
  it 'exists' do
    forecast = Forecast.new({})
    expect(forecast).to be_a(Forecast)
  end
end
