class CargoCarriage < Carriage
  attr_reader :filled_volume

  def initialize(volume = 0)
    @volume = volume
    @filled_volume = 0
  end

  def fill_volume(volume)
    if volume > @volume - @filled_volume
      @filled_volume += @volume
      volume - @volume
    else
      @filled_volume += volume
    end
  end

  def fill?
    free_volume.zero? ? true : false
  end

  def free_volume
    @volume - @filled_volume
  end

  def type
    :cargo
  end
end
