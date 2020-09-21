require 'securerandom'

class Api::V1::UsersController < ApplicationController
  def create
    @new_user = User.new(
      email: user_params[:email],
      password: user_params[:password],
      api_key: SecureRandom.hex(13)
      )
    if @new_user.valid?
      @new_user.save
      render json: {"data":
        {
          "type": "users",
          "id": @new_user.id,
          "attributes": {
            "email": @new_user.email,
            "api_key": @new_user.api_key
            }
          }
        }, status: 201
    else
      render json: {"data":
        {
          "errors": @new_user.errors.full_messages
        }
      }, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
