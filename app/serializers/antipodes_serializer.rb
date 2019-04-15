class AntipodesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id
  attribute :location_name do |object|
    object.location_name
  end
  attribute :forecast do |object|
    object.forecast
  end
  attribute :search_location do |object|
    object.search_location
  end
end
