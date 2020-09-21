class Api::V1::SessionsController < ApplicationController
  def create
    if user = User.find_by_email(user_params[:email])
      if user.authenticate(user_params[:password])
        render json: {"data":
          {
            "type": "users",
            "id": user.id,
            "attributes": {
              "email": user.email,
              "api_key": user.api_key
              }
            }
          }
      end
    else
      render json: {"data":
        {
          "errors": "Invalid credentials"
        }
      }, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
