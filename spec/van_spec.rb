require 'van'

describe Van do
  it "can carry up to 5 bikes" do
    expect(subject.capacity).to eq Van::DEFAULT_CAPACITY
  end
  let(:bike) {double :bike}
    describe "#release_bike" do
      it "releases a bike" do
        subject.pickup(bike)
        expect(subject.release_bike).to eq bike
      end
      it "releases a working bike to the dock station" do
        allow(bike).to receive(:working?).and_return(true)
        subject.pickup(bike)
        subject.travel
        subject.release_bike
        station = DockingStation.new
        station.dock(bike)
        expect(station.release_bike).to be_working
      end
    end

end
