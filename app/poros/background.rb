class Background
  def self.search(city)
    background_service = BackgroundService.new
    background_service.search(city)
  end
end
