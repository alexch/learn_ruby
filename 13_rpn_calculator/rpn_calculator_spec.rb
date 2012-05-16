# See
# * <http://en.wikipedia.org/wiki/Reverse_Polish_notation>
# * <http://www.calculator.org/rpn.aspx>
#
require "rpn_calculator"

describe RPNCalculator do

  attr_accessor :calculator

  before do
    @calculator = RPNCalculator.new
  end

  it "adds two numbers" do
    calculator.push(2)
    calculator.push(3)
    calculator.plus
    calculator.value.should == 5
  end

  it "adds three numbers" do
    calculator.push(2)
    calculator.push(3)
    calculator.push(4)
    calculator.plus
    calculator.value.should == 7
    calculator.plus
    calculator.value.should == 9
  end

  it "adds and subtracts" do
    calculator.push(2)
    calculator.push(3)
    calculator.push(4)
    calculator.minus
    calculator.value.should == 1
    calculator.plus
    calculator.value.should == 3
  end

  it "multiplies and divides" do
    calculator.push(2)
    calculator.push(3)
    calculator.push(4)
    calculator.divide
    calculator.value.should == (4.0 / 3.0)
    calculator.times
    calculator.value.should == (4.0 / 3.0) * 2
  end

  it "resolves operator precedence unambiguously" do
    # 1 2 + 3 * => (1 + 2) * 3
    calculator.push(1)
    calculator.push(2)
    calculator.plus
    calculator.push(3)
    calculator.times
    calculator.value.should == (1+2)*3

    # 1 2 3 * + => 1 + (2 * 3)
    calculator.push(1)
    calculator.push(2)
    calculator.push(3)
    calculator.times
    calculator.plus
    calculator.value.should == 1+(2*3)
  end

  it "fails informatively when there's not enough values stacked away" do
    expect {
      calculator.plus
    }.to raise_error("calculator is empty")

    expect {
      calculator.minus
    }.to raise_error("calculator is empty")

    expect {
      calculator.times
    }.to raise_error("calculator is empty")

    expect {
      calculator.divide
    }.to raise_error("calculator is empty")
  end

  # extra credit
  it "tokenizes a string" do
    calculator.tokens("1 2 3 * + 4 5 - /").should ==
      [1, 2, 3, :*, :+, 4, 5, :-, :/]
  end

  # extra credit
  it "evaluates a string" do
    calculator.evaluate("1 2 3 * +").should ==
      ((2 * 3) + 1)

    calculator.evaluate("4 5 -").should ==
      (5 - 4)

    calculator.evaluate("1 2 3 * + 4 5 - /").should ==
      (5.0 - 4) / ((2 * 3) + 1)
  end

end
