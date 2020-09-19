class Location
  def self.conversion(city)
    location_service = LocationService.new
    response = location_service.conversion(city)
    response[:results][0][:locations][0][:latLng]
  end
end
