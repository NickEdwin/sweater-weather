class Location
  def self.conversion(city)
    location_service = LocationService.new
    response = location_service.conversion(city)
    response[:results][0][:locations][0][:latLng]
  end

  def self.road_trip(origin, destination)
    location_service = LocationService.new
    response = location_service.road_trip(origin, destination)
    response[:route][:realTime] / 60
  end
end
