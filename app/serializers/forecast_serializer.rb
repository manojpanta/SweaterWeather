class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  
  attribute :location do |object|
    object.location
  end

  attribute :current_temperature do |object|
    object.current_temperature
  end

  attribute :time_now do |object|
    object.time_now
  end

  attribute :date_today do |object|
    object.date_today
  end

  attribute :highest_for_today do |object|
    object.highest_for_today
  end

  attribute :lowest_for_today do |object|
    object.lowest_for_today
  end

  attribute :humidity do |object|
    object.humidity
  end

  attribute :visibility do |object|
    object.visibility
  end

  attribute :uvindex do |object|
    object.uvindex
  end

  attribute :summary do |object|
    object.summary
  end

  attribute :weekly_summary do |object|
    object.weekly_summary
  end

  attribute :daily_forecast do |object|
    object.daily_forecast
  end

  attribute :hourly_forecast do |object|
    object.hourly_forecast
  end
end
