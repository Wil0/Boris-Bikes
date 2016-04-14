require "dockingstation"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:list_bikes) } #what step is this?

let(:bike) {double :bike}
  describe "#release_bike" do
    it "releases a docked bike" do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it "releases a working bike" do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end
    it "returns an error when there are no bikes available" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
    it "should not release a broken bike" do
      allow(bike).to receive(:working?).and_return(false)
      allow(bike).to receive(:report_broken).and_return(false)
      station = DockingStation.new
      bike.report_broken
      station.dock(bike)
      expect {station.release_bike}.to raise_error "No working bikes available"
    end
  end

  describe "#dock" do
    it "docks the bike" do
      expect(subject.dock(bike)).to eq [bike]
    end
    it "docks a broken bike" do
      allow(bike).to receive(:report_broken).and_return(false)
      bike.report_broken
      expect(subject.dock(bike)).to eq [bike]
    end
    it "does not allow you to dock a bike when the dock is full" do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(double :bike)}
      expect { subject.dock(double :bike) }.to raise_error "The dock is full"
    end
    it "does not allow you to dock a bike when the dock, with a custom capacity, is full" do
      station = DockingStation.new(50)
      subject.capacity.times {subject.dock(double :bike)}
      expect { subject.dock(double :bike) }.to raise_error "The dock is full"
    end

  end

  describe "#bike" do #when do you create this describe test
    it "returns docked bikes" do
      subject.dock(bike)
      expect(subject.list_bikes).to eq [bike]
    end
  end
  describe "New Docking Station" do
    it 'starts with a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end
end
