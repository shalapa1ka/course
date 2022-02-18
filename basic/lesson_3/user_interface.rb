require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'carriage'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'

class UserInterface
  attr_accessor :is_run
  attr_reader :trains, :stations, :action

  def initialize
    @is_run = true
    @action = {
      '1': 'create_station',
      '2': 'create_train',
      '3': 'add_carriage',
      '4': 'remove_carriage',
      '5': 'add_train_to_station',
      '6': 'show_stations_and_trains',
      '7': 'fill_volume',
      '8': 'buy_place',
      '9': 'end'
    }
  end

  def main
    while is_run
      puts '1. Create a station'
      puts '2. Create a train'
      puts '3. Add the carriage'
      puts '4. Remove the carriage'
      puts '5. Add a train to the station'
      puts '6. Show all'
      puts '7. Fill volume'
      puts '8. Buy ticket'
      puts '9. Stop'

      print 'Select one: '
      send action[gets.chomp.to_sym]
    end
  end

  private

  def create_station
    begin
      print 'Enter station title: '
      title = gets.chomp
    rescue StandardError
      puts 'Invalid input. Pleases try again'
      retry
    end

    Station.new(title)
    puts "Station #{title} created successful"
  end

  def create_train
    begin
      print 'Which type of train (pass or cargo): '
      type = gets.chomp
      print 'Enter train number: '
      number = gets.chomp

      case type
      when 'pass'
        PassengerTrain.new(number)
      when 'cargo'
        CargoTrain.new(number)
      end
    rescue StandardError
      puts 'Invalid input. Please try again'
      retry
    end
    puts "Train #{number} created successful"
  end

  def add_carriage
    print 'Enter train number: '
    number = gets.chomp
    case Train.find(number).type
    when :pass
      print 'Enter places count: '
      places = gets.chomp.to_i
      Train.find(number).add_car(PassengerCarriage.new(places))
    when :cargo
      print 'Enter volume size: '
      volume = gets.chomp.to_i
      Train.find(number).add_car(CargoCarriage.new(volume))
    end
  end

  def remove_carriage
    print 'Enter train number: '
    number = gets.chomp
    Train.find(number).remove_car
  end

  def add_train_to_station
    print 'Which station: '
    station_title = gets.chomp
    print 'Train number: '
    train_number = gets.chomp
    Station.find(station_title).add_train(Train.find(train_number))
  end

  def show_stations_and_trains
    block = proc do |train|
      train.each { |x| puts "\t#{x.number}: #{x.type}" }
    end

    Station.all.each do |station|
      puts "#{station.title}: "
      station.all_trains block
    end
  end

  def fill_volume
    print 'Enter train number: '
    number = gets.chomp
    return false if Train.find(number).type != 'cargo'

    print 'Enter volume: '
    v = gets.chomp.to_i
    Train.find(number).carriages.each do |carriage|
      break if carriage.fill?

      carriage.fill_volume(v)
    end
  end

  def buy_place
    print 'Enter train number: '
    number = gets.chomp
    false if Train.find(number).type != 'pass'
    print 'Enter carriage number: '
    carriage_number = gets.chomp.to_i
    Train.find(number).carriages[carriage_number - 1].buy_place
  end

  def end
    self.is_run = false
  end
end
