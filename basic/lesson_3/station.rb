class Station
  attr_reader :title,  :trains

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
