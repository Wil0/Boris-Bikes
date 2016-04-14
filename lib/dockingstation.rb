require_relative "bike"

class DockingStation
  attr_reader :bike
  def release_bike
    raise "No bikes available" unless @bike
    @bike
  end

  def dock(bike)
    raise "The dock is full" if @bike
    @bike = bike
  end
end
