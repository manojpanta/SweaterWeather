class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :favorites
  attribute :favorite do |object|
    
  end
end
