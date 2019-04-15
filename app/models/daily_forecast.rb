class DailyForecast
  attr_reader :id,
              :date,
              :summary,
              :icon,
              :high,
              :low,
              :humidity
  def initialize(data)
    @id = 1
    @date = Time.at(data[:time]).strftime("%A")
    @summary = data[:summary]
    @icon = data[:icon]
    @high = data[:temperatureHigh]
    @low = data[:temperatureLow]
    @humidity = (data[:humidity] * 100).to_i.to_s + "%"
  end
end
