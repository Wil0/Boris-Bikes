require 'dockingstation'

describe DockingStation do

	it { is_expected.to respond_to(:bike)}
	it { should respond_to(:dock).with(1).argument }

	it "releases a bike method" do
		expect(subject).to respond_to(:release_bike)
	end

	it "raises an error if empty" do
		expect{subject.release_bike}.to raise_error("Station empty")
	end

	it "raises an error if full" do
		subject.dock double(:bike)
		expect{DockingStation::DEFAULT_CAPACITY.times{subject.dock double(:bike)}}.to raise_error("Station full")
	end

	let(:bike) {double :bike}
	it 'expect the bike to be working' do
		allow(bike).to receive(:working?).and_return(true)
		expect(bike.working?).to be true
	end

	it 'should be able to dock an instance of a bike' do
		bike = double(:bike)
		expect(subject.dock(bike)).to eq([bike])
	end

	it 'should initialize with a default capacity of 20' do
		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	end

	it 'should initialize with the capacity you pass in' do
		station = DockingStation.new(10)
		expect(station.capacity).to eq 10
	end

	it 'should be able to report a bike as broken' do
		allow(bike).to receive(:report_broken).and_return(false)
		expect(bike.report_broken).to eq false
	end

	it 'should not release broken bikes' do
		bike = double("bike", :working? => false)
	  subject.dock(bike)
		expect{subject.release_bike}.to raise_error("Can't release a broken bike")
	end

	it 'should load bikes in the van' do
		bike = Bike.new
		expect(subject.load_bikes_in_van(bike)).to eq([bike])
	end
end
