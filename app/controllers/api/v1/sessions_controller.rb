class Api::V1::SessionsController < ApplicationController
  def create
    user_info = JSON.parse(request.body.read)
    user = User.find_by(email: user_info["email"])
    if user && user.authenticate(user_info["password"])
      session[:user_id] = user.id
      render json: {api_key: user.api_key}, status: 200
    elsif !user
      render json: {error: 'Not a valid email'}, status: 401
    elsif  !user.authenticate(user_info["password"])
      render json: {error: 'Could not be authenticated!!'}, status: 401
    end
  end
end
