class Station
  attr_reader :title,  :trains

  @@instances = []

  def initialize(title = '')
    @title = title
    @trains = []
    @@instances << self
  end

  def add_train(train)
    trains << train
  end

  def train_departure(train)
    trains.delete(train)
  end

  def self.all
    @@instances
  end
end
