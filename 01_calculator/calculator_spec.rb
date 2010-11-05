require "calculator"

describe Calculator do
  
  before do
    @calculator = Calculator.new
  end

  it "adds 0 and 0" do
    @calculator.add(0,0).should == 0
  end

  it "adds 2 and 2" do
    @calculator.add(2,2).should == 4
  end

  it "adds positive numbers" do
    @calculator.add(2,6).should == 8
  end

  it "subtracts numbers" do
    @calculator.subtract(10,4).should == 6
  end
end
