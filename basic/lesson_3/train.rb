class Train

  attr_accessor :speed, :carriages, :current_station_index, :route
  attr_reader :number

  def initialize(number = '', carriages = [])
    @number = number
    @carriages = carriages
    @speed = 0
    @route = nil
    @current_station_index = 0
  end

  def speed_up(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def add_car(carriage)
    carriages << carriage if speed.zero? && carriage.type == self.type
  end

  def remove_car
    carriages.pop if speed.zero?
  end

  def current_station
    route.stations[current_station_index]
  end

  def next_station
    route.stations[current_station_index + 1] if current_station_index < route.stations.size - 1
  end

  def previous_station
    route[current_station_index - 1] if current_station_index >= 1
  end

  def type
    nil
  end
end
