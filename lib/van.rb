require_relative 'bike'
require_relative 'garage'

class  Van
attr_reader :bike

DEFAULT_CAPACITY = 5

  def initialize(capacity=DEFAULT_CAPACITY)
    @van_array = []
    @van_capacity = capacity
  end

  def dock(bike)
		@van_array << bike
	end

  def load_bikes_from_dockingstation(bikes)
    raise 'The van is full' if @van_array.length >= 5
    raise "Working bikes can't be loaded" if bikes
    @van_array << bikes
  end

  def unload_bikes_to_dockingstation(bikes)
    @array_of_bikes << bikes
  end

  def unload_bikes_to_garage(bikes)
    @garage_space << bikes
  end



end
