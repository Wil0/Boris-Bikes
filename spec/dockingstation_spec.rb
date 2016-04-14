require "docking_station"

describe DockingStation do
  describe "release bike" do
  	it{should respond_to(:release_bike)}
  	it "releases a working bike" do
  	  bike = Bike.new
  	  subject.dock(bike)
  	  expect(subject.release_bike).to be_working
  	end

    it "raises an error when no bikes are available" do
      expect{subject.release_bike}.to raise_error 'No bike available'
    end

    it 'is a class of Bike' do
      bike = Bike.new
  	  subject.dock(bike)
      expect(subject.release_bike).to be_an_instance_of Bike
    end
  end

  describe "Docking" do
      it{should respond_to(:dock).with(1).argument}
      it "raises an error when docking station is full" do
      	DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
      	expect{subject.dock(Bike.new)}.to raise_error 'The docking station is full'
      end
  end

  describe "Bike" do
  	it "return docked bikes" do
	  	bike = Bike.new
	  	subject.dock(bike)
	    expect(subject.bikes).to eq [bike]
	   end
  end

  describe "New Docking Station" do
    it 'starts with a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end
end
