#pickup bikes
#release bikes
require 'bike'

class Van
  attr_reader :capacity, :bikes

  DEFAULT_CAPACITY = 5

  def initialize
    @capacity = DEFAULT_CAPACITY
    @bikes = []
    @location = "Garage"
  end

  def pickup(bike)
    if @location ==  "Docking Station" && bike.working? == true
      raise "Bike is not broken"
    elsif @location == "Garage" && bike.working? == false
      raise "Bike is broken"
    else
    @bikes << bike
    end
  end

  def release_bike
    @bikes.pop
  end

  def travel
    @location == "Garage" ? location = "Docking Station" : location = "Garage"
  end

end
