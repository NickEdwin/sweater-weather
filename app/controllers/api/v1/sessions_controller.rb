class Api::V1::SessionsController < ApplicationController
  def create
    if user = User.find_by_email(user_params[:email])
      if user.authenticate(user_params[:password])
        session[:user_id] = user.id
        render json: SessionsSerializer.new(user)
      else
        render json: {"data":{"errors": "Invalid password"}}, status: 400
      end
    else
      render json: {"data":{"errors": "Invalid credentials"}}, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
