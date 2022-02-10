class Station
  attr_accessor :trains
  attr_reader :title

  def initialize(title = '')
    @title = title
    @trains = []
  end

  def add_train(train)
    trains << train
  end

  def train_departure(train)
    trains.delete(train)
  end
end
