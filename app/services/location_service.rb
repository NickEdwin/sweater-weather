class LocationService
  def conversion(city)
    response = conn.get("geocoding/v1/address?key=#{ENV['ENV_MAPQUEST_KEY']}&location=#{city}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "http://www.mapquestapi.com/")
  end
end
