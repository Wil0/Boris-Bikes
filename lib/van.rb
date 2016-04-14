#pickup bikes
#release bikes
class Van
  attr_reader :capacity, :bikes

  DEFAULT_CAPACITY = 5

  def initialize
    @capacity = DEFAULT_CAPACITY
    @bikes = []
    @location = "Garage"
  end

  def pickup(bike)
    @bikes << bike
  end

  def release_bike
    @bikes.pop
  end

  def travel
    @location == "Garage" ? location = "Docking Station" : location = "Garage"
  end

end
