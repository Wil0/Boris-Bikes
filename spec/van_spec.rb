require 'van'

describe Van do
  it "can carry up to 5 bikes" do
    expect(subject.capacity).to eq Van::DEFAULT_CAPACITY
  end
end
