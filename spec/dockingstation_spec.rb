require "dockingstation"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bikes) } #what step is this?

  describe "#release_bike" do
    it "releases a docked bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it "releases a working bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end
    it "returns an error when there are no bikes available" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end

  describe "#dock" do
    it "docks the bike" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end
    it "does not allow you to dock a bike when the dock is full" do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
      expect { subject.dock(Bike.new) }.to raise_error "The dock is full"
    end
  end

  describe "#bike" do #when do you create this describe test
    it "returns docked bikes" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end
  end
  describe "New Docking Station" do
    it 'starts with a default capacity' do
      expect(subject.capacity).to eq subject.capacity
    end
  end
end
