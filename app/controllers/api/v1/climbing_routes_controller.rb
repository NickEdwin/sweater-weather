class Api::V1::ClimbingRoutesController < ApplicationController
  def show
    lat_long = Location.conversion(params[:location])
    @weather = Weather.forecast(lat_long)
    @trails = Trail.seach(lat_long)
    # @distance = Location.distance(lat_long, @trails[:end, lat_long])
  end
end
