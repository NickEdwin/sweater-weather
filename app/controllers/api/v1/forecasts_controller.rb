class Api::V1::ForecastsController < ApplicationController
  def show
    @lat_long = Location.conversion(params[:location])

    @weather = Weather.forecast(@lat_long)
    render json: @weather
  end
end
