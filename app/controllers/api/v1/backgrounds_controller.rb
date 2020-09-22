class Api::V1::BackgroundsController < ApplicationController
  def show
    image = BackgroundFacade.new(params[:location])
    render json: BackgroundSerializer.new(image)
  end
end
