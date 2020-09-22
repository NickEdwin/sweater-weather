class TrailService
  def search(lat_long)
    response = conn.get("data/get-routes-for-lat-lon?lat=#{lat_long[:lat]}&lon=#{lat_long[:lng]}&maxDistance=10&key=#{ENV['ENV_MOUNTAINPROJECT_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://www.mountainproject.com/")
  end
end
