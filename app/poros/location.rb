class Location
  def self.conversion(city)
    location_service = LocationService.new
    response = location_service.conversion(city)
    response[:results][0][:locations][0][:latLng]
  end

  def self.distance(start, lat, long)
    location_service = LocationService.new
    location_service.distance(start, lat, long)
  end
end
