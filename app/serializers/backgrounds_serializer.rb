class BackgroundsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image_url, :id, :location
end
