require 'bike'

describe Bike do
  it {is_expected.to respond_to(:working?)}
  it 'report a bike as broken' do
    expect(subject.report_broken).not_to be_working
  end

end
