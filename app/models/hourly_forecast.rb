class HourlyForecast
  attr_reader :id,
              :time,
              :icon,
              :temperature
  def initialize(data)
    @id = 1
    @time = Time.at(data[:time]).strftime("%I %p")
    @icon = data[:icon]
    @temperature = data[:temperature].to_i
  end
end
