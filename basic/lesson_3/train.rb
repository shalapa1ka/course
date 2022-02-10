class Train
  attr_reader :number, :type, :route
  attr_accessor :speed, :carriages, :current_station_index

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
    @route = nil
    @current_station_index = nil
  end

  def get_route(route: Route)
    self.route = route
    self.current_station_index = 0
  end

  def speed_up(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def add_wagon
    self.carriages += 1 if speed.zero?
  end

  def remove_wagon
    self.carriages -= 1 if speed.zero?
  end

  def current_station
    route.stations[current_station_index]
  end

  def next_station
    route.stations[current_station_index + 1] if current_station_index < route.stations.size - 1
  end

  def previous_station
    route.stations[current_station_index - 1] if current_station_index >= 1
  end
end
