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
    @trains = []
    @stations = []
    @action = {
      '1': 'create_station',
      '2': 'create_train',
      '3': 'add_carriage',
      '4': 'remove_carriage',
      '5': 'add_train_to_station',
      '6': 'show_stations_and_trains',
      '7': 'end'
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
      puts '7. Stop'

      print 'Select one: '
      send action[gets.chomp.to_sym]
    end
  end

  private

  def create_station
    print 'Enter station title: '
    title = gets.chomp
    puts "Station #{title} created successful" if stations << Station.new(title)
  end

  def create_train
    print 'Which type of train (pass or cargo): '
    type = gets.chomp
    print 'Enter train number: '
    number = gets.chomp

    case type
    when 'pass'
      trains << PassengerTrain.new(number)
    when 'cargo'
      trains << CargoTrain.new(number)
    else
      puts 'This type of train does not exist.'
      nil
    end

    puts "Train #{number} created successful"
  end

  def add_carriage
    print 'Enter train number: '
    number = gets.chomp
    index = trains.map(&:number).index(number)
    case trains[index].type
    when :pass
      trains[index].add_car(PassengerCarriage.new)
    when :cargo
      trains[index].add_car(CargoCarriage.new)
    end
  end

  def remove_carriage
    print 'Enter train number: '
    number = gets.chomp
    index = trains.map(&:number).index(number)
    case trains[index].type
    when :pass
      trains[index].remove_car
    when :cargo
      trains[index].remove_car
    end
  end

  def add_train_to_station
    print 'Which station: '
    station_title = gets.chomp
    print 'Train number: '
    train_number = gets.chomp
    stations[stations.map(&:title).index(station_title)].trains << trains[trains.map(&:number).index(train_number)]
  end

  def show_stations_and_trains
    stations.each do |station|
      print "#{station.title} - "
      print station.trains.map(&:number)
      puts
    end
    puts
  end

  def end
    self.is_run = false
  end
end
