class Api::V1::UsersController < ApplicationController
  def create
    hash = JSON.parse(request.body.read)
    user = User.create(hash)
    render json: {api_key: user.api_key}, status: 201
  end
end
