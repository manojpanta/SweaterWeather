require 'rails_helper'
describe 'request to /api/v1/forecast with' do
  it 'address params returns forcast for the location', :vcr do
    location = "Denver"
    get "/api/v1/forecast?location=#{location}"

    result = JSON.parse(response.body)

    expect(response).to be_successful
    expect(result).to have_key("data")
    expect(result["data"]["attributes"]).to have_key("location")
    expect(result["data"]["attributes"]).to have_key("current_temperature")
    expect(result["data"]["attributes"]).to have_key("time_now")
    expect(result["data"]["attributes"]).to have_key("date_today")
    expect(result["data"]["attributes"]).to have_key("highest_for_today")
    expect(result["data"]["attributes"]).to have_key("lowest_for_today")
    expect(result["data"]["attributes"]).to have_key("humidity")
    expect(result["data"]["attributes"]).to have_key("visibility")
    expect(result["data"]["attributes"]).to have_key("uvindex")
    expect(result["data"]["attributes"]).to have_key("summary")
    expect(result["data"]["attributes"]).to have_key("weekly_summary")

    expect(result["data"]["attributes"]).to have_key("daily_forecast")
    expect(result["data"]["attributes"]["daily_forecast"].first).to have_key("id")
    expect(result["data"]["attributes"]["daily_forecast"].first).to have_key("date")
    expect(result["data"]["attributes"]["daily_forecast"].first).to have_key("summary")
    expect(result["data"]["attributes"]["daily_forecast"].first).to have_key("icon")
    expect(result["data"]["attributes"]["daily_forecast"].first).to have_key("high")
    expect(result["data"]["attributes"]["daily_forecast"].first).to have_key("low")
    expect(result["data"]["attributes"]["daily_forecast"].first).to have_key("humidity")

    expect(result["data"]["attributes"]).to have_key("hourly_forecast")
    expect(result["data"]["attributes"]["hourly_forecast"].first).to have_key("id")
    expect(result["data"]["attributes"]["hourly_forecast"].first).to have_key("time")
    expect(result["data"]["attributes"]["hourly_forecast"].first).to have_key("icon")
    expect(result["data"]["attributes"]["hourly_forecast"].first).to have_key("temperature")
  end
end
