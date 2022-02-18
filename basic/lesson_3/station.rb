class Station
  attr_reader :title, :trains

  @@instances = []
  TITLE_FORMAT = /[a-z]{3,}/.freeze

  def initialize(title = '')
    @title = title
    @trains = []
    @@instances << self
    valid!
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

  def valid?
    valid!
  rescue StandardError
    false
  end

  protected

  def valid!
    raise 'Invalid title' if @title !~ TITLE_FORMAT
    true
  end
end
