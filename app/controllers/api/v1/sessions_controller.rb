class Api::V1::SessionsController < ApplicationController
  def create
    user_info = JSON.parse(request.body.read)
    user = User.find_by(email: user_info["email"])
    if user && user.authenticate(user_info["password"])
      session[:user_id] = user.id
      render json: {api_key: user.api_key}, status: 200
    else
      render json: { api_key: user.errors}, status: 400
    end
  end
end
