class Antipode
  attr_reader :id,
              :location_name,
              :search_location
  def initialize(data, search_location, amypode_location)
    @id = 1
    @data = data
    @search_location = search_location
    @location_name = amypode_location
  end

  def forecast
    {summary: @data[:currently][:summary],
      current_temperature:  @data[:currently][:temperature].to_i}
  end
end
