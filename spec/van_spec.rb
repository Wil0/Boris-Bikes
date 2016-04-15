require 'van'
require 'bike'
require 'dockingstation'

describe Van do

  it 'can hold up to five bikes' do
    broken_bikes = Bike.new.report_broken
    expect(Van::DEFAULT_CAPACITY.times{subject.load_bikes_from_dockingstation(broken_bikes)}).to eq(5)
  end

  it 'will raise an error if more bikes are added' do
    broken_bikes = Bike.new.report_broken
    expect{6.times{subject.load_bikes_from_dockingstation(broken_bikes)}}.to raise_error("The van is full")
  end

  it 'will raise an error if a working bike is added' do
    expect{subject.load_bikes_from_dockingstation(Bike.new)}.to raise_error("Working bikes can't be loaded")
  end

  it 'should unload working bikes on the docking station' do
    bike = double(:bike)
    garage = double(:garage)
    expect(subject.unload_bikes_to_garage(bike)).to eq bike
  end
end
