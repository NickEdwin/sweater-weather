class TrailSerializer
  def self.all_trails(location)
    lat_long = Location.conversion(location)
    weather = Weather.forecast(lat_long)
    trails = Trail.search(lat_long)

    {
      data:{
        id: "null",
        type: "climbing_route",
        attributes: {
          location: location,
          forecast: {
            summary: weather[:current][:weather][0][:description],
            temperature: weather[:current][:feels_like]
              },
            routes: trails.each do |trail|
              {
                name: trail.name,
                type: trail.type,
                rating: trail.rating,
                location: trail.location,
                distance_to_route: trail.distance_to_route
              }
            end
          }
      }
    }
  end
end
