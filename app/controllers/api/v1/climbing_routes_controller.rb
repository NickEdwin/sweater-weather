class Api::V1::ClimbingRoutesController < ApplicationController
  def show
    lat_long = Location.conversion(params[:location])
    weather = Weather.forecast(lat_long)
    @trails = Trail.search(lat_long)

    render json: {
      id: "null", type: "climbing_route",
      attributes: {location: params[:location],
        forecast: {summary: weather[:current][:weather][0][:description], temperature: weather[:current][:feels_like]}},
      routes: @trails
    }
  end
end
