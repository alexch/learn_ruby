require "#{File.dirname(__FILE__)}/calculator"

describe Calculator do
  
  before do
    @calculator = Calculator.new
  end

  describe "#sum" do
    it "computes the sum of an empty array" do
      @calculator.sum([]).should == 0
    end
    
    it "computes the sum of an array of one number" do
      @calculator.sum([7]).should == 7
    end
    
    it "computes the sum of an array of two numbers" do
      @calculator.sum([7,11]).should == 18
    end
    
    it "computes the sum of an array of many numbers" do
      @calculator.sum([1,3,5,7,9]).should == 25
    end
  end
  
  # Test-Driving Bonus: once the above tests pass, 
  # write tests and code for the following:
  
  it "multiplies two numbers"

  it "multiplies an array of numbers"
  
  it "raises one number to the power of another number"
  
  # http://en.wikipedia.org/wiki/Factorial
  describe "#factorial" do
    it "computes the factorial of 0"
    it "computes the factorial of 1"
    it "computes the factorial of 2"
    it "computes the factorial of 5"
    it "computes the factorial of 10"
  end

end
