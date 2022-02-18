require_relative 'validation'

class Station
  include Validation

  @@instances = {}
  TITLE_FORMAT = /[a-z]{3,}/.freeze

  attr_accessor :title
  attr_reader :trains

  validate :title, :presence
  validate :title, :format, TITLE_FORMAT

  def initialize(title = '')
    @title = title
    @trains = []
    validate!
    @@instances[title] = self
  end

  def add_train(train)
    trains << train
  end

  def train_departure(train)
    trains.delete(train)
  end

  def self.all
    @@instances.values
  end

  def self.find(title)
    @@instances[title]
  end

  def all_trains(block)
    block.call(trains)
  end
end
