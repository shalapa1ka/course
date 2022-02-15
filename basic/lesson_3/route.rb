class Route
  attr_reader :start, :finish, :stations

  def initialize(start = nil, finish = nil)
    @start = start
    @finish = finish
    @stations = [self.start, self.finish]
  end

  def add_intermediate_station(station)
    stations.insert(-2, station)
  end

  def remove_intermediate_station(station)
    stations.delete(station)
  end

  def show_route
    print stations.map(&:title)
  end
end
