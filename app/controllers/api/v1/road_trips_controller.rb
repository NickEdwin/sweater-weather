class Api::V1::RoadTripsController < ApplicationController
  def show
    user = User.find_by(api_key: user_params[:api_key])
    if user
      trip = TripFacade.new(user_params[:origin], user_params[:destination])
      render json: TripSerializer.new(trip)
    else
      render json: {"data":{"errors": "Invalid credentials"}}, status: 401
    end
  end

  def user_params
    params.permit(:origin, :destination, :api_key)
  end
end
