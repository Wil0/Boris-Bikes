require_relative 'bike'
require_relative 'van'

class DockingStation
attr_reader :bike, :capacity

DEFAULT_CAPACITY = 20

	def initialize(capacity=DEFAULT_CAPACITY)
	 	@array_of_bikes = []
		@capacity = capacity
	end

	def release_bike
		raise "Station empty" if empty?
		raise "Can't release a broken bike" if @array_of_bikes.last.working? == false
		@array_of_bikes.pop
	end

	def dock(bike)
		raise "Station full" if full?
		@array_of_bikes << bike
	end

	private

	def full?
	  @array_of_bikes.length >= DEFAULT_CAPACITY
	end

	def empty?
	  @array_of_bikes.length <= 0
	end
end
