class Trip
  attr_reader :id,
              :origin,
              :destination,
              :arrival_temp,
              :arrival_description,
              :travel_time

  def initialize(origin, destination)
    @id = nil
    @origin = origin
    @destination = destination
    @arrival_temp = arrival_temp(destination)
    @arrival_description = arrival_description(destination)
    @travel_time = travel_time(origin, destination)
  end


  def arrival_temp(destination)
    weather = current_weather(destination)
    weather.high_temp
  end

  def arrival_description(destination)
    weather = current_weather(destination)
    weather.description
  end

  def current_weather(destination)
    weather_service = WeatherService.new
    response = weather_service.forecast(coordinates(destination))
    Forecast.new(response)
  end

  def coordinates(destination)
    location_service = LocationService.new
    response = location_service.conversion(destination)
    response[:results][0][:locations][0][:latLng]
  end

  def travel_time(origin, destination)
    location_service = LocationService.new
    response = location_service.travel_info(origin, destination)
    response[:route][:realTime] / 60
  end
end
