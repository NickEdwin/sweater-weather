class Api::V1::ForecastsController < ApplicationController
  def show
    @lat_long = Location.conversion(params[:location])
    @image = Image.seach(params[:location])
    @weather = Weather.forecast(@lat_long)
    render json: @weather
  end
end
