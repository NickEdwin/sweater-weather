class LocationService
  def conversion(city)
    response = conn.get("geocoding/v1/address?key=#{ENV['ENV_MAPQUEST_KEY']}&location=#{city}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def distance(start, lat, lng)
    response = conn.get("directions/v2/route?from=#{start}&to=#{lat},#{lng}&key=#{ENV['ENV_MAPQUEST_KEY']}")
    body = JSON.parse(response.body, symbolize_names: true)
    distance = body[:route][:distance]
    (distance * 0.00062137).round(2) if distance
  end

  private

  def conn
    Faraday.new(url: "http://www.mapquestapi.com/")
  end
end
