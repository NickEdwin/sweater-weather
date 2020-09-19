class Weather
  def self.forecast(lat_long)
    weather_service = WeatherService.new
    weather_service.forecast(lat_long)
  end
end
