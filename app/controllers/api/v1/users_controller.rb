class Api::V1::UsersController < ApplicationController
  def create
    hash = JSON.parse(request.body.read)
    if hash[:password] == hash[:password_confirmation]
      user = User.new(hash)
      user.api_key = SecureRandom.urlsafe_base64.to_s
      if user.save
        render json: {api_key: user.api_key}, status: 201
      else
        render json: {error: user.errors}, status: 404
      end
    else
      render json: {error: 'Your password did not match'}, status: 404
    end
  end
end
