class TripFacade
  attr_reader :id,
              :type,
              :trip

  def initialize(origin, destination)
    @id = nil
    @type = "trip"
    @trip = Trip.new(origin, destination)
  end
end
