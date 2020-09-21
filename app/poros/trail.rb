class Trail
  def self.search(lat_long)
    trail_service = TrailService.new
    trail_service.search(lat_long)
  end
end
