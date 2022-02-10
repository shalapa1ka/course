class Route

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
    puts stations.map(&:title)
  end

  attr_reader :start, :finish, :stations
end
