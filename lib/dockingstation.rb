require_relative "bike"

class DockingStation
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

 def initialize(capacity=DEFAULT_CAPACITY)
   @bikes = []
   @capacity = capacity
 end

  def release_bike
    if empty?
      raise "No bikes available"
    elsif @bikes.last.working? == false
      raise "No working bikes available"
    else
      @bikes.pop
    end
  end

  def dock(bike)
    raise "The dock is full" if full?
    @bikes << bike
  end

 def list_bikes
   bikes
 end

  private

  attr_reader :bikes

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end


end
