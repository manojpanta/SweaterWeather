class DailyForecast
  attr_reader :id,
              :date,
              :summary,
              :icon,
              :high,
              :low,
              :humidity,
              :precipitation
  def initialize(data)
    @id = 1
    @date = Time.at(data[:time]).strftime("%A")
    @summary = data[:summary]
    @icon = data[:icon]
    @high = data[:temperatureHigh]
    @low = data[:temperatureLow]
    @precipitation = (data[:precipProbability] * 100).to_i.to_s + " %"
    @humidity = (data[:humidity] * 100).to_i.to_s + "%"
  end
end
