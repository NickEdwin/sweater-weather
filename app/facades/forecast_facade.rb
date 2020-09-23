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
    weather_service = WeatherService.new
    response = weather_service.forecast(coordinates(location))
    Forecast.new(response)
  end

  def coordinates(location)
    location_service = LocationService.new
    response = location_service.conversion(location)
    response[:results][0][:locations][0][:latLng]
  end
end
