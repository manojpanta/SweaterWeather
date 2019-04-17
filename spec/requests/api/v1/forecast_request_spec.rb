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

  ##not disabling vcr and working without wifi below
  it 'address params returns forecast for a location with out api call if in db ' do
  string = "{\"latitude\":39.7392358,\"longitude\":-104.990251,\"timezone\":\"America/Denver\",\"currently\":{\"time\":1555464248,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-day\",\"nearestStormDistance\":1,\"nearestStormBearing\":242,\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":60.62,\"apparentTemperature\":60.62,\"dewPoint\":39.49,\"humidity\":0.46,\"pressure\":1005.86,\"windSpeed\":4.49,\"windGust\":12.39,\"windBearing\":14,\"cloudCover\":0.73,\"uvIndex\":0,\"visibility\":3.53,\"ozone\":329.85},\"minutely\":{\"summary\":\"Mostly cloudy for the hour.\",\"icon\":\"partly-cloudy-day\",\"data\":[{\"time\":1555464240,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555464300,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555464360,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555464420,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555464480,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555464540,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555464600,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555464660,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555464720,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555464780,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555464840,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555464900,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555464960,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555465020,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555465080,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555465140,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555465200,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555465260,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555465320,\"precipIntensity\":0.003,\"precipIntensityError\":0.001,\"precipProbability\":0.01,\"precipType\":\"rain\"},{\"time\":1555465380,\"precipIntensity\":0,\"precipProbability\":0},{\"time\":1555465440,\"precipIntensity\":0.004,\"precipIntensityError\":0.001,\"precipProbability\":0.01,\"precipType\":\"rain\"},{\"time\":1555465500,\"precipIntensity\":0.003,\"precipIntensityError\":0.001,\"precipProbability\":0.01,\"precipType\":\"rain\"},{\"time\":1555465560,\"precipIntensity\":0.003,\"precipIntensityError\":0.001,\"precipProbability\":0.02,\"precipType\":\"rain\"},{\"time\":1555465620,\"precipIntensity\":0.003,\"precipIntensityError\":0.001,\"precipProbability\":0.02,\"precipType\":\"rain\"},{\"time\":1555465680,\"precipIntensity\":0.003,\"precipIntensityError\":0.001,\"precipProbability\":0.03,\"precipType\":\"rain\"},{\"time\":1555465740,\"precipIntensity\":0.003,\"precipIntensityError\":0.002,\"precipProbability\":0.04,\"precipType\":\"rain\"},{\"time\":1555465800,\"precipIntensity\":0.004,\"precipIntensityError\":0.002,\"precipProbability\":0.04,\"precipType\":\"rain\"},{\"time\":1555465860,\"precipIntensity\":0.003,\"precipIntensityError\":0.002,\"precipProbability\":0.05,\"precipType\":\"rain\"},{\"time\":1555465920,\"precipIntensity\":0.003,\"precipIntensityError\":0.002,\"precipProbability\":0.06,\"precipType\":\"rain\"},{\"time\":1555465980,\"precipIntensity\":0.004,\"precipIntensityError\":0.002,\"precipProbability\":0.07,\"precipType\":\"rain\"},{\"time\":1555466040,\"precipIntensity\":0.004,\"precipIntensityError\":0.002,\"precipProbability\":0.07,\"precipType\":\"rain\"},{\"time\":1555466100,\"precipIntensity\":0.004,\"precipIntensityError\":0.002,\"precipProbability\":0.08,\"precipType\":\"rain\"},{\"time\":1555466160,\"precipIntensity\":0.004,\"precipIntensityError\":0.002,\"precipProbability\":0.09,\"precipType\":\"rain\"},{\"time\":1555466220,\"precipIntensity\":0.004,\"precipIntensityError\":0.002,\"precipProbability\":0.1,\"precipType\":\"rain\"},{\"time\":1555466280,\"precipIntensity\":0.004,\"precipIntensityError\":0.003,\"precipProbability\":0.11,\"precipType\":\"rain\"},{\"time\":1555466340,\"precipIntensity\":0.004,\"precipIntensityError\":0.003,\"precipProbability\":0.11,\"precipType\":\"rain\"},{\"time\":1555466400,\"precipIntensity\":0.004,\"precipIntensityError\":0.003,\"precipProbability\":0.11,\"precipType\":\"rain\"},{\"time\":1555466460,\"precipIntensity\":0.004,\"precipIntensityError\":0.004,\"precipProbability\":0.12,\"precipType\":\"rain\"},{\"time\":1555466520,\"precipIntensity\":0.004,\"precipIntensityError\":0.003,\"precipProbability\":0.13,\"precipType\":\"rain\"},{\"time\":1555466580,\"precipIntensity\":0.004,\"precipIntensityError\":0.004,\"precipProbability\":0.13,\"precipType\":\"rain\"},{\"time\":1555466640,\"precipIntensity\":0.004,\"precipIntensityError\":0.004,\"precipProbability\":0.13,\"precipType\":\"rain\"},{\"time\":1555466700,\"precipIntensity\":0.004,\"precipIntensityError\":0.004,\"precipProbability\":0.13,\"precipType\":\"rain\"},{\"time\":1555466760,\"precipIntensity\":0.004,\"precipIntensityError\":0.005,\"precipProbability\":0.14,\"precipType\":\"rain\"},{\"time\":1555466820,\"precipIntensity\":0.005,\"precipIntensityError\":0.004,\"precipProbability\":0.14,\"precipType\":\"rain\"},{\"time\":1555466880,\"precipIntensity\":0.005,\"precipIntensityError\":0.004,\"precipProbability\":0.14,\"precipType\":\"rain\"},{\"time\":1555466940,\"precipIntensity\":0.005,\"precipIntensityError\":0.005,\"precipProbability\":0.14,\"precipType\":\"rain\"},{\"time\":1555467000,\"precipIntensity\":0.005,\"precipIntensityError\":0.005,\"precipProbability\":0.15,\"precipType\":\"rain\"},{\"time\":1555467060,\"precipIntensity\":0.005,\"precipIntensityError\":0.005,\"precipProbability\":0.15,\"precipType\":\"rain\"},{\"time\":1555467120,\"precipIntensity\":0.005,\"precipIntensityError\":0.005,\"precipProbability\":0.15,\"precipType\":\"rain\"},{\"time\":1555467180,\"precipIntensity\":0.005,\"precipIntensityError\":0.005,\"precipProbability\":0.16,\"precipType\":\"rain\"},{\"time\":1555467240,\"precipIntensity\":0.005,\"precipIntensityError\":0.005,\"precipProbability\":0.15,\"precipType\":\"rain\"},{\"time\":1555467300,\"precipIntensity\":0.005,\"precipIntensityError\":0.005,\"precipProbability\":0.16,\"precipType\":\"rain\"},{\"time\":1555467360,\"precipIntensity\":0.005,\"precipIntensityError\":0.005,\"precipProbability\":0.15,\"precipType\":\"rain\"},{\"time\":1555467420,\"precipIntensity\":0.006,\"precipIntensityError\":0.006,\"precipProbability\":0.15,\"precipType\":\"rain\"},{\"time\":1555467480,\"precipIntensity\":0.006,\"precipIntensityError\":0.006,\"precipProbability\":0.16,\"precipType\":\"rain\"},{\"time\":1555467540,\"precipIntensity\":0.006,\"precipIntensityError\":0.006,\"precipProbability\":0.16,\"precipType\":\"rain\"},{\"time\":1555467600,\"precipIntensity\":0.006,\"precipIntensityError\":0.006,\"precipProbability\":0.16,\"precipType\":\"rain\"},{\"time\":1555467660,\"precipIntensity\":0.006,\"precipIntensityError\":0.006,\"precipProbability\":0.16,\"precipType\":\"rain\"},{\"time\":1555467720,\"precipIntensity\":0.006,\"precipIntensityError\":0.006,\"precipProbability\":0.15,\"precipType\":\"rain\"},{\"time\":1555467780,\"precipIntensity\":0.006,\"precipIntensityError\":0.006,\"precipProbability\":0.16,\"precipType\":\"rain\"},{\"time\":1555467840,\"precipIntensity\":0.006,\"precipIntensityError\":0.006,\"precipProbability\":0.16,\"precipType\":\"rain\"}]},\"hourly\":{\"summary\":\"Partly cloudy throughout the day.\",\"icon\":\"partly-cloudy-day\",\"data\":[{\"time\":1555462800,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":61.61,\"apparentTemperature\":61.61,\"dewPoint\":39.17,\"humidity\":0.43,\"pressure\":1005.38,\"windSpeed\":5.61,\"windGust\":12.34,\"windBearing\":23,\"cloudCover\":0.75,\"uvIndex\":0,\"visibility\":3.62,\"ozone\":329.94},{\"time\":1555466400,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0.0036,\"precipProbability\":0.16,\"precipType\":\"rain\",\"temperature\":59.15,\"apparentTemperature\":59.15,\"dewPoint\":39.85,\"humidity\":0.49,\"pressure\":1006.57,\"windSpeed\":3.2,\"windGust\":12.46,\"windBearing\":350,\"cloudCover\":0.69,\"uvIndex\":0,\"visibility\":3.4,\"ozone\":329.73},{\"time\":1555470000,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0.0151,\"precipProbability\":0.04,\"precipType\":\"rain\",\"temperature\":56.54,\"apparentTemperature\":56.54,\"dewPoint\":40.5,\"humidity\":0.55,\"pressure\":1006.28,\"windSpeed\":3.32,\"windGust\":9.03,\"windBearing\":312,\"cloudCover\":0.64,\"uvIndex\":0,\"visibility\":10,\"ozone\":330.02},{\"time\":1555473600,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0.0118,\"precipProbability\":0.03,\"precipType\":\"rain\",\"temperature\":55.25,\"apparentTemperature\":55.25,\"dewPoint\":39.03,\"humidity\":0.54,\"pressure\":1005.97,\"windSpeed\":4.24,\"windGust\":10.98,\"windBearing\":322,\"cloudCover\":0.58,\"uvIndex\":0,\"visibility\":10,\"ozone\":331.22},{\"time\":1555477200,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0.003,\"precipProbability\":0.01,\"precipType\":\"rain\",\"temperature\":54.27,\"apparentTemperature\":54.27,\"dewPoint\":37.9,\"humidity\":0.54,\"pressure\":1006,\"windSpeed\":4.65,\"windGust\":8.47,\"windBearing\":252,\"cloudCover\":0.44,\"uvIndex\":0,\"visibility\":10,\"ozone\":332.93},{\"time\":1555480800,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0.0003,\"precipProbability\":0.01,\"precipType\":\"rain\",\"temperature\":52.56,\"apparentTemperature\":52.56,\"dewPoint\":39.03,\"humidity\":0.6,\"pressure\":1006.26,\"windSpeed\":4.24,\"windGust\":6.29,\"windBearing\":231,\"cloudCover\":0.42,\"uvIndex\":0,\"visibility\":10,\"ozone\":334.55},{\"time\":1555484400,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":50.95,\"apparentTemperature\":50.95,\"dewPoint\":37.94,\"humidity\":0.61,\"pressure\":1006.97,\"windSpeed\":3.69,\"windGust\":4.94,\"windBearing\":129,\"cloudCover\":0.54,\"uvIndex\":0,\"visibility\":10,\"ozone\":335.97},{\"time\":1555488000,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0.0003,\"precipProbability\":0.01,\"precipType\":\"rain\",\"temperature\":49.6,\"apparentTemperature\":48.09,\"dewPoint\":36.19,\"humidity\":0.6,\"pressure\":1007.88,\"windSpeed\":4.46,\"windGust\":5.5,\"windBearing\":190,\"cloudCover\":0.35,\"uvIndex\":0,\"visibility\":10,\"ozone\":337.29},{\"time\":1555491600,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0.0002,\"precipProbability\":0.01,\"precipType\":\"rain\",\"temperature\":49.15,\"apparentTemperature\":46.84,\"dewPoint\":34.67,\"humidity\":0.57,\"pressure\":1008.61,\"windSpeed\":5.66,\"windGust\":7.58,\"windBearing\":286,\"cloudCover\":0.35,\"uvIndex\":0,\"visibility\":10,\"ozone\":338.3},{\"time\":1555495200,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0.0004,\"precipProbability\":0.01,\"precipType\":\"rain\",\"temperature\":45.64,\"apparentTemperature\":44.09,\"dewPoint\":34.03,\"humidity\":0.64,\"pressure\":1009.26,\"windSpeed\":3.7,\"windGust\":3.98,\"windBearing\":234,\"cloudCover\":0.33,\"uvIndex\":0,\"visibility\":10,\"ozone\":338.71},{\"time\":1555498800,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0.0008,\"precipProbability\":0.02,\"precipType\":\"rain\",\"temperature\":43.32,\"apparentTemperature\":43.32,\"dewPoint\":33.13,\"humidity\":0.67,\"pressure\":1009.61,\"windSpeed\":3,\"windGust\":3.12,\"windBearing\":246,\"cloudCover\":0.46,\"uvIndex\":0,\"visibility\":10,\"ozone\":338.81},{\"time\":1555502400,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0.0014,\"precipProbability\":0.02,\"precipType\":\"rain\",\"temperature\":41.71,\"apparentTemperature\":40.07,\"dewPoint\":33.06,\"humidity\":0.71,\"pressure\":1010.11,\"windSpeed\":3.21,\"windGust\":3.43,\"windBearing\":306,\"cloudCover\":0.39,\"uvIndex\":0,\"visibility\":10,\"ozone\":338.72},{\"time\":1555506000,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0.002,\"precipProbability\":0.02,\"precipType\":\"rain\",\"temperature\":42.21,\"apparentTemperature\":40.07,\"dewPoint\":33.84,\"humidity\":0.72,\"pressure\":1011.08,\"windSpeed\":3.79,\"windGust\":5.31,\"windBearing\":285,\"cloudCover\":0.36,\"uvIndex\":0,\"visibility\":10,\"ozone\":338.24},{\"time\":1555509600,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0.0025,\"precipProbability\":0.04,\"precipType\":\"rain\",\"temperature\":45.29,\"apparentTemperature\":41.41,\"dewPoint\":35.45,\"humidity\":0.68,\"pressure\":1012.26,\"windSpeed\":7.19,\"windGust\":15.15,\"windBearing\":23,\"cloudCover\":0.41,\"uvIndex\":1,\"visibility\":10,\"ozone\":337.66},{\"time\":1555513200,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0.0033,\"precipProbability\":0.06,\"precipType\":\"rain\",\"temperature\":46.46,\"apparentTemperature\":41.98,\"dewPoint\":36.22,\"humidity\":0.67,\"pressure\":1012.97,\"windSpeed\":9.15,\"windGust\":14.64,\"windBearing\":35,\"cloudCover\":0.6,\"uvIndex\":2,\"visibility\":10,\"ozone\":338.13},{\"time\":1555516800,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0.0019,\"precipProbability\":0.04,\"precipType\":\"rain\",\"temperature\":47.84,\"apparentTemperature\":43.62,\"dewPoint\":36.37,\"humidity\":0.64,\"pressure\":1013.2,\"windSpeed\":9.29,\"windGust\":13.72,\"windBearing\":27,\"cloudCover\":0.63,\"uvIndex\":3,\"visibility\":10,\"ozone\":340.04},{\"time\":1555520400,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0.0006,\"precipProbability\":0.03,\"precipType\":\"rain\",\"temperature\":49.28,\"apparentTemperature\":45.64,\"dewPoint\":35.95,\"humidity\":0.6,\"pressure\":1013.06,\"windSpeed\":8.62,\"windGust\":10.88,\"windBearing\":16,\"cloudCover\":0.65,\"uvIndex\":4,\"visibility\":10,\"ozone\":343.1},{\"time\":1555524000,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0.0003,\"precipProbability\":0.03,\"precipType\":\"rain\",\"temperature\":51,\"apparentTemperature\":51,\"dewPoint\":35.29,\"humidity\":0.55,\"pressure\":1012.71,\"windSpeed\":8.02,\"windGust\":8.73,\"windBearing\":8,\"cloudCover\":0.67,\"uvIndex\":5,\"visibility\":10,\"ozone\":347},{\"time\":1555527600,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":52.68,\"apparentTemperature\":52.68,\"dewPoint\":34.57,\"humidity\":0.5,\"pressure\":1011.96,\"windSpeed\":7.8,\"windGust\":8.41,\"windBearing\":5,\"cloudCover\":0.65,\"uvIndex\":5,\"visibility\":10,\"ozone\":353.08},{\"time\":1555531200,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":54.7,\"apparentTemperature\":54.7,\"dewPoint\":33.69,\"humidity\":0.45,\"pressure\":1010.97,\"windSpeed\":7.65,\"windGust\":8.84,\"windBearing\":6,\"cloudCover\":0.63,\"uvIndex\":5,\"visibility\":10,\"ozone\":360.01},{\"time\":1555534800,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":56.85,\"apparentTemperature\":56.85,\"dewPoint\":32.78,\"humidity\":0.4,\"pressure\":1010.3,\"windSpeed\":7.54,\"windGust\":9.28,\"windBearing\":9,\"cloudCover\":0.61,\"uvIndex\":4,\"visibility\":10,\"ozone\":364.2},{\"time\":1555538400,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":58.64,\"apparentTemperature\":58.64,\"dewPoint\":31.83,\"humidity\":0.36,\"pressure\":1010.13,\"windSpeed\":7.63,\"windGust\":9.51,\"windBearing\":4,\"cloudCover\":0.62,\"uvIndex\":3,\"visibility\":10,\"ozone\":363.22},{\"time\":1555542000,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":60.39,\"apparentTemperature\":60.39,\"dewPoint\":30.89,\"humidity\":0.33,\"pressure\":1010.28,\"windSpeed\":7.73,\"windGust\":9.72,\"windBearing\":359,\"cloudCover\":0.63,\"uvIndex\":2,\"visibility\":10,\"ozone\":359.36},{\"time\":1555545600,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":61.13,\"apparentTemperature\":61.13,\"dewPoint\":30.38,\"humidity\":0.31,\"pressure\":1010.7,\"windSpeed\":7.51,\"windGust\":9.66,\"windBearing\":2,\"cloudCover\":0.64,\"uvIndex\":1,\"visibility\":10,\"ozone\":355.88},{\"time\":1555549200,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":60.35,\"apparentTemperature\":60.35,\"dewPoint\":30.73,\"humidity\":0.32,\"pressure\":1011.5,\"windSpeed\":6.54,\"windGust\":8.71,\"windBearing\":33,\"cloudCover\":0.65,\"uvIndex\":0,\"visibility\":10,\"ozone\":354.08},{\"time\":1555552800,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":58.05,\"apparentTemperature\":58.05,\"dewPoint\":31.56,\"humidity\":0.36,\"pressure\":1012.6,\"windSpeed\":5.25,\"windGust\":7.53,\"windBearing\":293,\"cloudCover\":0.67,\"uvIndex\":0,\"visibility\":10,\"ozone\":352.64},{\"time\":1555556400,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":55.85,\"apparentTemperature\":55.85,\"dewPoint\":31.86,\"humidity\":0.4,\"pressure\":1013.71,\"windSpeed\":4.75,\"windGust\":7.8,\"windBearing\":301,\"cloudCover\":0.66,\"uvIndex\":0,\"visibility\":10,\"ozone\":351.21},{\"time\":1555560000,\"summary\":\"Mostly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":53.97,\"apparentTemperature\":53.97,\"dewPoint\":31.12,\"humidity\":0.42,\"pressure\":1014.8,\"windSpeed\":5.28,\"windGust\":11.35,\"windBearing\":260,\"cloudCover\":0.65,\"uvIndex\":0,\"visibility\":10,\"ozone\":349.4},{\"time\":1555563600,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0.0004,\"precipProbability\":0.01,\"precipType\":\"rain\",\"temperature\":52.3,\"apparentTemperature\":52.3,\"dewPoint\":29.84,\"humidity\":0.42,\"pressure\":1015.89,\"windSpeed\":6.69,\"windGust\":16.41,\"windBearing\":342,\"cloudCover\":0.58,\"uvIndex\":0,\"visibility\":10,\"ozone\":347.6},{\"time\":1555567200,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0.0007,\"precipProbability\":0.01,\"precipType\":\"rain\",\"temperature\":50.83,\"apparentTemperature\":50.83,\"dewPoint\":28.78,\"humidity\":0.42,\"pressure\":1016.78,\"windSpeed\":7.59,\"windGust\":19.26,\"windBearing\":296,\"cloudCover\":0.49,\"uvIndex\":0,\"visibility\":10,\"ozone\":346.59},{\"time\":1555570800,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-night\",\"precipIntensity\":0.0004,\"precipProbability\":0.01,\"precipType\":\"rain\",\"temperature\":49.59,\"apparentTemperature\":46.43,\"dewPoint\":28.3,\"humidity\":0.43,\"pressure\":1017.32,\"windSpeed\":7.6,\"windGust\":18.03,\"windBearing\":308,\"cloudCover\":0.34,\"uvIndex\":0,\"visibility\":10,\"ozone\":346.96},{\"time\":1555574400,\"summary\":\"Clear\",\"icon\":\"clear-night\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":48.1,\"apparentTemperature\":44.79,\"dewPoint\":27.99,\"humidity\":0.45,\"pressure\":1017.69,\"windSpeed\":7.23,\"windGust\":14.64,\"windBearing\":273,\"cloudCover\":0.16,\"uvIndex\":0,\"visibility\":10,\"ozone\":348.12},{\"time\":1555578000,\"summary\":\"Clear\",\"icon\":\"clear-night\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":46.58,\"apparentTemperature\":43.24,\"dewPoint\":27.74,\"humidity\":0.48,\"pressure\":1018.1,\"windSpeed\":6.67,\"windGust\":11.21,\"windBearing\":292,\"cloudCover\":0.03,\"uvIndex\":0,\"visibility\":10,\"ozone\":348.69},{\"time\":1555581600,\"summary\":\"Clear\",\"icon\":\"clear-night\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":44.18,\"apparentTemperature\":40.95,\"dewPoint\":27.32,\"humidity\":0.51,\"pressure\":1018.78,\"windSpeed\":5.65,\"windGust\":7.9,\"windBearing\":301,\"cloudCover\":0.01,\"uvIndex\":0,\"visibility\":10,\"ozone\":348.3},{\"time\":1555585200,\"summary\":\"Clear\",\"icon\":\"clear-night\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":41.98,\"apparentTemperature\":39.29,\"dewPoint\":26.96,\"humidity\":0.55,\"pressure\":1019.48,\"windSpeed\":4.37,\"windGust\":4.58,\"windBearing\":309,\"cloudCover\":0.01,\"uvIndex\":0,\"visibility\":10,\"ozone\":347.32},{\"time\":1555588800,\"summary\":\"Clear\",\"icon\":\"clear-night\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":40.79,\"apparentTemperature\":38.63,\"dewPoint\":26.78,\"humidity\":0.57,\"pressure\":1019.96,\"windSpeed\":3.58,\"windGust\":3.66,\"windBearing\":315,\"cloudCover\":0.02,\"uvIndex\":0,\"visibility\":10,\"ozone\":345.94},{\"time\":1555592400,\"summary\":\"Clear\",\"icon\":\"clear-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":42.31,\"apparentTemperature\":40.54,\"dewPoint\":26.93,\"humidity\":0.54,\"pressure\":1020.15,\"windSpeed\":3.41,\"windGust\":5.23,\"windBearing\":16,\"cloudCover\":0.01,\"uvIndex\":0,\"visibility\":10,\"ozone\":343.94},{\"time\":1555596000,\"summary\":\"Clear\",\"icon\":\"clear-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":45.33,\"apparentTemperature\":43.51,\"dewPoint\":27.31,\"humidity\":0.49,\"pressure\":1020.1,\"windSpeed\":3.97,\"windGust\":9.15,\"windBearing\":21,\"cloudCover\":0.01,\"uvIndex\":1,\"visibility\":10,\"ozone\":341.62},{\"time\":1555599600,\"summary\":\"Clear\",\"icon\":\"clear-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":48.58,\"apparentTemperature\":46.62,\"dewPoint\":27.41,\"humidity\":0.44,\"pressure\":1019.89,\"windSpeed\":4.89,\"windGust\":12.64,\"windBearing\":10,\"cloudCover\":0.01,\"uvIndex\":2,\"visibility\":10,\"ozone\":339.42},{\"time\":1555603200,\"summary\":\"Clear\",\"icon\":\"clear-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":51.46,\"apparentTemperature\":51.46,\"dewPoint\":26.9,\"humidity\":0.38,\"pressure\":1019.57,\"windSpeed\":6.67,\"windGust\":15.07,\"windBearing\":10,\"cloudCover\":0.04,\"uvIndex\":4,\"visibility\":10,\"ozone\":337.94},{\"time\":1555606800,\"summary\":\"Clear\",\"icon\":\"clear-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":54.53,\"apparentTemperature\":54.53,\"dewPoint\":26.03,\"humidity\":0.33,\"pressure\":1019.15,\"windSpeed\":9.01,\"windGust\":17.52,\"windBearing\":4,\"cloudCover\":0.09,\"uvIndex\":6,\"visibility\":10,\"ozone\":336.84},{\"time\":1555610400,\"summary\":\"Clear\",\"icon\":\"clear-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":56.78,\"apparentTemperature\":56.78,\"dewPoint\":25.38,\"humidity\":0.3,\"pressure\":1018.58,\"windSpeed\":10.85,\"windGust\":19.74,\"windBearing\":0,\"cloudCover\":0.14,\"uvIndex\":7,\"visibility\":10,\"ozone\":335.05},{\"time\":1555614000,\"summary\":\"Clear\",\"icon\":\"clear-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":59.01,\"apparentTemperature\":59.01,\"dewPoint\":25.25,\"humidity\":0.27,\"pressure\":1017.86,\"windSpeed\":11.72,\"windGust\":21.39,\"windBearing\":355,\"cloudCover\":0.23,\"uvIndex\":7,\"visibility\":10,\"ozone\":332.22},{\"time\":1555617600,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":61.2,\"apparentTemperature\":61.2,\"dewPoint\":25.47,\"humidity\":0.25,\"pressure\":1017.03,\"windSpeed\":12.01,\"windGust\":22.42,\"windBearing\":351,\"cloudCover\":0.34,\"uvIndex\":7,\"visibility\":10,\"ozone\":328.96},{\"time\":1555621200,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":63.71,\"apparentTemperature\":63.71,\"dewPoint\":25.88,\"humidity\":0.24,\"pressure\":1016.37,\"windSpeed\":12.07,\"windGust\":22.59,\"windBearing\":348,\"cloudCover\":0.42,\"uvIndex\":5,\"visibility\":10,\"ozone\":325.49},{\"time\":1555624800,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":65.47,\"apparentTemperature\":65.47,\"dewPoint\":26.42,\"humidity\":0.23,\"pressure\":1015.89,\"windSpeed\":12.21,\"windGust\":21.86,\"windBearing\":345,\"cloudCover\":0.44,\"uvIndex\":4,\"visibility\":10,\"ozone\":322.19},{\"time\":1555628400,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":67.06,\"apparentTemperature\":67.06,\"dewPoint\":27.08,\"humidity\":0.22,\"pressure\":1015.56,\"windSpeed\":12.12,\"windGust\":20.26,\"windBearing\":344,\"cloudCover\":0.46,\"uvIndex\":2,\"visibility\":10,\"ozone\":318.77},{\"time\":1555632000,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":66.95,\"apparentTemperature\":66.95,\"dewPoint\":27.79,\"humidity\":0.23,\"pressure\":1015.76,\"windSpeed\":11.38,\"windGust\":17.69,\"windBearing\":341,\"cloudCover\":0.46,\"uvIndex\":1,\"visibility\":10,\"ozone\":315.95},{\"time\":1555635600,\"summary\":\"Partly Cloudy\",\"icon\":\"partly-cloudy-day\",\"precipIntensity\":0,\"precipProbability\":0,\"temperature\":65.32,\"apparentTemperature\":65.32,\"dewPoint\":28.64,\"humidity\":0.25,\"pressure\":1016.72,\"windSpeed\":9.4,\"windGust\":13.45,\"windBearing\":332,\"cloudCover\":0.41,\"uvIndex\":0,\"visibility\":10,\"ozone\":313.94}]},\"daily\":{\"summary\":\"Light rain today and Sunday, with high temperatures peaking at 78°F on Saturday.\",\"icon\":\"rain\",\"data\":[{\"time\":1555394400,\"summary\":\"Mostly cloudy throughout the day.\",\"icon\":\"partly-cloudy-day\",\"sunriseTime\":1555417314,\"sunsetTime\":1555465182,\"moonPhase\":0.4,\"precipIntensity\":0.0018,\"precipIntensityMax\":0.0151,\"precipIntensityMaxTime\":1555470000,\"precipProbability\":0.2,\"precipType\":\"rain\",\"temperatureHigh\":66.1,\"temperatureHighTime\":1555452000,\"temperatureLow\":41.71,\"temperatureLowTime\":1555502400,\"apparentTemperatureHigh\":66.1,\"apparentTemperatureHighTime\":1555452000,\"apparentTemperatureLow\":40.07,\"apparentTemperatureLowTime\":1555506000,\"dewPoint\":38.57,\"humidity\":0.56,\"pressure\":1006.11,\"windSpeed\":2.6,\"windGust\":18.89,\"windGustTime\":1555455600,\"windBearing\":9,\"cloudCover\":0.49,\"uvIndex\":5,\"uvIndexTime\":1555434000,\"visibility\":5.11,\"ozone\":328.22,\"temperatureMin\":43.31,\"temperatureMinTime\":1555419600,\"temperatureMax\":66.1,\"temperatureMaxTime\":1555452000,\"apparentTemperatureMin\":43.31,\"apparentTemperatureMinTime\":1555419600,\"apparentTemperatureMax\":66.1,\"apparentTemperatureMaxTime\":1555452000},{\"time\":1555480800,\"summary\":\"Partly cloudy throughout the day.\",\"icon\":\"partly-cloudy-day\",\"sunriseTime\":1555503626,\"sunsetTime\":1555551642,\"moonPhase\":0.44,\"precipIntensity\":0.0006,\"precipIntensityMax\":0.0033,\"precipIntensityMaxTime\":1555513200,\"precipProbability\":0.21,\"precipType\":\"rain\",\"temperatureHigh\":61.13,\"temperatureHighTime\":1555545600,\"temperatureLow\":40.79,\"temperatureLowTime\":1555588800,\"apparentTemperatureHigh\":61.13,\"apparentTemperatureHighTime\":1555545600,\"apparentTemperatureLow\":38.63,\"apparentTemperatureLowTime\":1555588800,\"dewPoint\":33.77,\"humidity\":0.52,\"pressure\":1011.12,\"windSpeed\":3.84,\"windGust\":16.41,\"windGustTime\":1555563600,\"windBearing\":352,\"cloudCover\":0.55,\"uvIndex\":5,\"uvIndexTime\":1555524000,\"visibility\":10,\"ozone\":346.55,\"temperatureMin\":41.71,\"temperatureMinTime\":1555502400,\"temperatureMax\":61.13,\"temperatureMaxTime\":1555545600,\"apparentTemperatureMin\":40.07,\"apparentTemperatureMinTime\":1555506000,\"apparentTemperatureMax\":61.13,\"apparentTemperatureMaxTime\":1555545600},{\"time\":1555567200,\"summary\":\"Partly cloudy starting in the afternoon.\",\"icon\":\"partly-cloudy-day\",\"sunriseTime\":1555589939,\"sunsetTime\":1555638103,\"moonPhase\":0.47,\"precipIntensity\":0.0002,\"precipIntensityMax\":0.0007,\"precipIntensityMaxTime\":1555567200,\"precipProbability\":0.01,\"precipType\":\"rain\",\"temperatureHigh\":67.06,\"temperatureHighTime\":1555628400,\"temperatureLow\":42.59,\"temperatureLowTime\":1555675200,\"apparentTemperatureHigh\":67.06,\"apparentTemperatureHighTime\":1555628400,\"apparentTemperatureLow\":40.57,\"apparentTemperatureLowTime\":1555675200,\"dewPoint\":27.54,\"humidity\":0.37,\"pressure\":1018.34,\"windSpeed\":6.77,\"windGust\":22.59,\"windGustTime\":1555621200,\"windBearing\":338,\"cloudCover\":0.22,\"uvIndex\":7,\"uvIndexTime\":1555610400,\"visibility\":10,\"ozone\":331.98,\"temperatureMin\":40.79,\"temperatureMinTime\":1555588800,\"temperatureMax\":67.06,\"temperatureMaxTime\":1555628400,\"apparentTemperatureMin\":38.63,\"apparentTemperatureMinTime\":1555588800,\"apparentTemperatureMax\":67.06,\"apparentTemperatureMaxTime\":1555628400},{\"time\":1555653600,\"summary\":\"Clear throughout the day.\",\"icon\":\"clear-day\",\"sunriseTime\":1555676253,\"sunsetTime\":1555724564,\"moonPhase\":0.52,\"precipIntensity\":0.0001,\"precipIntensityMax\":0.0003,\"precipIntensityMaxTime\":1555675200,\"precipProbability\":0.01,\"precipType\":\"rain\",\"temperatureHigh\":77.22,\"temperatureHighTime\":1555714800,\"temperatureLow\":52.78,\"temperatureLowTime\":1555765200,\"apparentTemperatureHigh\":77.22,\"apparentTemperatureHighTime\":1555714800,\"apparentTemperatureLow\":52.78,\"apparentTemperatureLowTime\":1555765200,\"dewPoint\":30.71,\"humidity\":0.35,\"pressure\":1016.3,\"windSpeed\":2.4,\"windGust\":10.13,\"windGustTime\":1555729200,\"windBearing\":162,\"cloudCover\":0.03,\"uvIndex\":9,\"uvIndexTime\":1555696800,\"visibility\":10,\"ozone\":301.88,\"temperatureMin\":42.59,\"temperatureMinTime\":1555675200,\"temperatureMax\":77.22,\"temperatureMaxTime\":1555714800,\"apparentTemperatureMin\":40.57,\"apparentTemperatureMinTime\":1555675200,\"apparentTemperatureMax\":77.22,\"apparentTemperatureMaxTime\":1555714800},{\"time\":1555740000,\"summary\":\"Mostly cloudy throughout the day.\",\"icon\":\"partly-cloudy-day\",\"sunriseTime\":1555762568,\"sunsetTime\":1555811024,\"moonPhase\":0.55,\"precipIntensity\":0.0008,\"precipIntensityMax\":0.0073,\"precipIntensityMaxTime\":1555822800,\"precipProbability\":0.03,\"precipType\":\"rain\",\"temperatureHigh\":78.03,\"temperatureHighTime\":1555786800,\"temperatureLow\":43.22,\"temperatureLowTime\":1555855200,\"apparentTemperatureHigh\":78.03,\"apparentTemperatureHighTime\":1555786800,\"apparentTemperatureLow\":38.69,\"apparentTemperatureLowTime\":1555855200,\"dewPoint\":28.38,\"humidity\":0.26,\"pressure\":1005.37,\"windSpeed\":4.27,\"windGust\":24.08,\"windGustTime\":1555822800,\"windBearing\":209,\"cloudCover\":0.71,\"uvIndex\":5,\"uvIndexTime\":1555783200,\"visibility\":10,\"ozone\":304.37,\"temperatureMin\":52.78,\"temperatureMinTime\":1555765200,\"temperatureMax\":78.03,\"temperatureMaxTime\":1555786800,\"apparentTemperatureMin\":52.78,\"apparentTemperatureMinTime\":1555765200,\"apparentTemperatureMax\":78.03,\"apparentTemperatureMaxTime\":1555786800},{\"time\":1555826400,\"summary\":\"Light rain in the morning and evening.\",\"icon\":\"rain\",\"sunriseTime\":1555848884,\"sunsetTime\":1555897485,\"moonPhase\":0.59,\"precipIntensity\":0.0225,\"precipIntensityMax\":0.0473,\"precipIntensityMaxTime\":1555848000,\"precipProbability\":0.96,\"precipType\":\"rain\",\"temperatureHigh\":50.61,\"temperatureHighTime\":1555873200,\"temperatureLow\":34.97,\"temperatureLowTime\":1555934400,\"apparentTemperatureHigh\":50.61,\"apparentTemperatureHighTime\":1555873200,\"apparentTemperatureLow\":32.68,\"apparentTemperatureLowTime\":1555930800,\"dewPoint\":38.7,\"humidity\":0.72,\"pressure\":1014.92,\"windSpeed\":7.96,\"windGust\":25.8,\"windGustTime\":1555826400,\"windBearing\":32,\"cloudCover\":0.99,\"uvIndex\":4,\"uvIndexTime\":1555866000,\"visibility\":3.79,\"ozone\":333.28,\"temperatureMin\":41.78,\"temperatureMinTime\":1555909200,\"temperatureMax\":56.44,\"temperatureMaxTime\":1555826400,\"apparentTemperatureMin\":38.35,\"apparentTemperatureMinTime\":1555909200,\"apparentTemperatureMax\":56.44,\"apparentTemperatureMaxTime\":1555826400},{\"time\":1555912800,\"summary\":\"Foggy until afternoon.\",\"icon\":\"fog\",\"sunriseTime\":1555935200,\"sunsetTime\":1555983946,\"moonPhase\":0.62,\"precipIntensity\":0.0038,\"precipIntensityMax\":0.0117,\"precipIntensityMaxTime\":1555948800,\"precipProbability\":0.51,\"precipType\":\"rain\",\"temperatureHigh\":59.64,\"temperatureHighTime\":1555977600,\"temperatureLow\":40.52,\"temperatureLowTime\":1556020800,\"apparentTemperatureHigh\":59.64,\"apparentTemperatureHighTime\":1555977600,\"apparentTemperatureLow\":36.35,\"apparentTemperatureLowTime\":1556017200,\"dewPoint\":34.39,\"humidity\":0.64,\"pressure\":1019.63,\"windSpeed\":1.22,\"windGust\":11.06,\"windGustTime\":1555912800,\"windBearing\":130,\"cloudCover\":0.84,\"uvIndex\":4,\"uvIndexTime\":1555952400,\"visibility\":3.99,\"ozone\":342.81,\"temperatureMin\":34.97,\"temperatureMinTime\":1555934400,\"temperatureMax\":59.64,\"temperatureMaxTime\":1555977600,\"apparentTemperatureMin\":32.68,\"apparentTemperatureMinTime\":1555930800,\"apparentTemperatureMax\":59.64,\"apparentTemperatureMaxTime\":1555977600},{\"time\":1555999200,\"summary\":\"Partly cloudy throughout the day.\",\"icon\":\"partly-cloudy-day\",\"sunriseTime\":1556021518,\"sunsetTime\":1556070407,\"moonPhase\":0.65,\"precipIntensity\":0.0002,\"precipIntensityMax\":0.0015,\"precipIntensityMaxTime\":1556078400,\"precipProbability\":0.02,\"precipType\":\"rain\",\"temperatureHigh\":72.59,\"temperatureHighTime\":1556053200,\"temperatureLow\":44.01,\"temperatureLowTime\":1556107200,\"apparentTemperatureHigh\":72.59,\"apparentTemperatureHighTime\":1556053200,\"apparentTemperatureLow\":42.12,\"apparentTemperatureLowTime\":1556107200,\"dewPoint\":30.55,\"humidity\":0.38,\"pressure\":1016.43,\"windSpeed\":2.59,\"windGust\":22.22,\"windGustTime\":1556064000,\"windBearing\":245,\"cloudCover\":0.36,\"uvIndex\":7,\"uvIndexTime\":1556049600,\"visibility\":10,\"ozone\":355.71,\"temperatureMin\":40.52,\"temperatureMinTime\":1556020800,\"temperatureMax\":72.59,\"temperatureMaxTime\":1556053200,\"apparentTemperatureMin\":36.35,\"apparentTemperatureMinTime\":1556017200,\"apparentTemperatureMax\":72.59,\"apparentTemperatureMaxTime\":1556053200}]},\"flags\":{\"sources\":[\"nearest-precip\",\"nwspa\",\"cmc\",\"gfs\",\"hrrr\",\"icon\",\"isd\",\"madis\",\"nam\",\"sref\",\"darksky\"],\"nearest-station\":0.837,\"units\":\"us\"},\"offset\":-6}"

    location = "denver"
    Weather.create(location: location, weather_data: string)
    get "/api/v1/forecast?location=Denver"

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
