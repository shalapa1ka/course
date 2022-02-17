require_relative 'company'
require_relative 'validation'

class Train
  include Validation
  include Company

  @@instances = {}
  NUMBER_FORMAT = /^[\da-z]{3}-*[\da-z]{2}$/i.freeze

  attr_accessor :speed, :carriages, :current_station_index, :route
  attr_reader :number

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  def initialize(number = '')
    @number = number
    @carriages = []
    @speed = 0
    @route = nil
    @current_station_index = 0
    validate!
    @@instances[number] = self
  end

  def speed_up(speed)
    self.speed += speed
  end

  def stop
    self.speed = 0
  end

  def add_car(carriage)
    carriages << carriage if speed.zero? && carriage.type == type
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

  def all_carriages(block)
    block.call(carriages)
  end

  def type
    nil
  end

  def self.find(number)
    @@instances[number]
  end
end
