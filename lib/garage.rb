require 'bike'
require 'van'

class Garage
  attr_reader :bike

    DEFAULT_CAPACITY = 10

  def initialize
    @garage_space = []
  end

  def store_bikes(bikes)
    raise "Garage full" if full?
    @garage_space << bikes
  end

  def fix_bikes
    @working = true
  end

  def release_fixed_bikes

  end

  def full?
    @garage_space.length >= DEFAULT_CAPACITY
  end
end
