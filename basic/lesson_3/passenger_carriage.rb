class PassengerCarriage < Carriage
  attr_reader :purchased_places

  def initialize(places = 0)
    @places = places
    @purchased_places = 0
  end

  def buy_place
    if free_place.positive?
      @purchased_places += 1
      true
    else
      false
    end
  end

  def free_place
    @places - @purchased_places
  end

  def type
    :pass
  end
end
