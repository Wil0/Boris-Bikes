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
end
