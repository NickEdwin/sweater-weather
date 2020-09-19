class WeatherService
  def forecast(lat_long)
    response = conn.get("data/2.5/onecall?lat=#{lat_long[:lat]}&lon=#{lat_long[:lng]}&appid=#{ENV['ENV_WEATHERMAP_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.openweathermap.org/")
  end
end
