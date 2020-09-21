class Trail
  def self.search(lat_long)
    trail_service = TrailService.new
    trail_info = trail_service.search(lat_long)

    @trails  = trail_info[:routes].map do |trail|
      Trail.new(trail)
    end
  end


  attr_reader :name,
              :type,
              :rating,
              :location


  def initialize(trail_info)
    @name = trail_info[:name]
    @type = trail_info[:type]
    @rating = trail_info[:rating]
    @location = trail_info[:location]
  end
end
