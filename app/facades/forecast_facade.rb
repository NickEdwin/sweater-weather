class ForecastFacade
  attr_reader :id,
              :location,
              :forecast

  def initialize(location)
    @id = nil
    @location = location
    @forecast = current_weather(location)
  end

  def current_weather(location)
    lat_long = Location.conversion(location)
    weather_service = WeatherService.new
    response = weather_service.forecast(lat_long)
    Forecast.new(response)
  end
end
