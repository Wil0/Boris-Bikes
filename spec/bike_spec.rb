require "bike"

RSpec.describe Bike do
  describe "working bike" do
  	it {should respond_to(:working?)}
  end
end
