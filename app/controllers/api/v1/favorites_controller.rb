class Api::V1::FavoritesController  < ApplicationController
  def index
    return render json: {error: "API key must present"} if !params["api_key"]
    api_key = params["api_key"]
    if user = User.find_by(api_key: api_key)
      render json: ForecastSerializer.new(FavoritesFacade.new(user).favorites), status: 200
    else
      render json: {error: 'Invalid API key' }, status: 401
    end
  end

  def create
    body = JSON.parse(request.body.read)
    return render json: {error: "API key must present"} if !body["api_key"]
    if user = User.find_by(api_key: body["api_key"])
      user.favorites.create(location: "#{body["location"]}")
      render json: {success: "Favorited `#{body["location"]}`"}
    else
      render json: {
        error: 'Invalid API key'
      }, status: 401
    end
  end
end
