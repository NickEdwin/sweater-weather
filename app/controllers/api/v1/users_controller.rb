class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(
      email: user_params[:email],
      password: user_params[:password],
      api_key: SecureRandom.hex(13)
      )

    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: {"data":{"errors": user.errors.full_messages}}, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
