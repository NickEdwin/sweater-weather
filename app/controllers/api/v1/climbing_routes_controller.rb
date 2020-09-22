class Api::V1::ClimbingRoutesController < ApplicationController
  def show
    render json: TrailSerializer.all_trails(params[:location])
  end
end
