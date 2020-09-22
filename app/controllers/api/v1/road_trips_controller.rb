class Api::V1::RoadTripsController < ApplicationController
  def show
    travel_time = Location.road_trip(user_params[:origin], user_params[:destination])
    lat_long = Location.conversion(user_params[:destination])
    weather = Weather.forecast(lat_long)

    user = User.where(api_key: user_params[:api_key])

    if user.any?
      render json: {data:
      {
        type: "trip",
        id: "null",
        attributes: {
          origin: user_params[:origin],
          destination: user_params[:destination],
          travel_time_mins: travel_time,
          forecast: {
            temperature: weather[:current][:temp],
            description: weather[:current][:weather][0][:description]
          },
          api_key: user_params[:api_key]
          }
        }
      }
    else
      render json: {"data":
        {
          "errors": "Invalid credentials"
        }
      }, status: 401
    end
  end

  def user_params
    params.permit(:origin, :destination, :api_key)
  end
end
