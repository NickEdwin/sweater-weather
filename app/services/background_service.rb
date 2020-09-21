class BackgroundService
  def search(city)
    search = city[0..-4]

    response = conn.get("api/?key=#{ENV['ENV_PIXABAY_KEY']}&q=#{search}&image_type=photo&pretty=true")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://pixabay.com/")
  end
end
