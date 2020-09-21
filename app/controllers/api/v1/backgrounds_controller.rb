class Api::V1::BackgroundsController < ApplicationController
  def show
    @background = Background.search(params[:location])
    render json: @background[:hits].sample(1)
  end
end
