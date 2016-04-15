require 'van'
require 'bike'
require 'garage'

describe Garage do

  let (:bike) {double :bike}
  it 'can hold up to ten bikes' do
    expect(Garage::DEFAULT_CAPACITY.times{subject.store_bikes(Bike.new)}).to eq(10)
  end

  it 'raise an error when bikes are docked and the garage is full' do
    subject.store_bikes(Bike.new)
    expect{Garage::DEFAULT_CAPACITY.times{subject.store_bikes(Bike.new)}}.to raise_error("Garage full")
  end

  it 'can fix bikes' do
    allow(bike).to receive(:fix_bikes).and_return(true)
    expect(bike.fix_bikes).to eq true
  end

  it 'releases fixed bikes' do
		allow(bike).to receive(:release_fixed_bikes).and_return(true)
	end

  it "raises an error if empty" do
  		expect{subject.release_fixed_bikes}.to raise_error("Garage empty")
  end

  it "raises an error if a broken bike is released" do
    bike = double("bike", :working? => false)
    subject.store_bikes(bike)
    expect{subject.release_fixed_bikes}.to raise_error ("A broken bike can't be released")
  end
end
