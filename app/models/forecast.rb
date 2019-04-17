class Forecast
  attr_reader :id
  def initialize(data, location)
    @location = location
    @id = 4
    @data = data
  end

  def time_now
    Time.now.strftime("%I:%M %p")
    # Time.at(@data[:currently][:time]).strftime("%I:%M %p")
  end

  def date_today
    Time.at(@data[:daily][:data][0][:time]).strftime("%m/%d")
  end

  def location
    @location
  end

  def current_temperature
    @data[:currently][:temperature]
  end

  def humidity
    @data[:currently][:humidity] * 100
  end

  def visibility
    @data[:currently][:visibility]
  end

  def uvindex
    @data[:currently][:uvIndex]
  end

  def summary
    @data[:currently][:summary]
  end

  def weekly_summary
    @data[:daily][:summary]
  end

  def daily_forecast
    @data[:daily][:data].map do |data|
      DailyForecast.new(data)
    end
  end

  def hourly_forecast
    @data[:hourly][:data].map do |data|
      HourlyForecast.new(data)
    end
  end

  def highest_for_today
    @data[:daily][:data][0][:temperatureHigh].to_i
  end

  def lowest_for_today
    @data[:daily][:data][0][:temperatureLow].to_i
  end
end
