require "temperature"

describe Temperature do

  it "can be constructed in degrees fahrenheit" do
    Temperature.new(50).degrees_fahrenheit.should == 50
  end

  it "converts freezing from fahrenheit to celsius" do
    Temperature.new(32).degrees_celsius.should == 0
  end

  it "converts boiling from fahrenheit to celsius" do
    Temperature.new(212).degrees_celsius.should == 100
  end

  it "converts body temperature from fahrenheit to celsius" do
    Temperature.new(98.6).degrees_celsius.should == 37
  end

  it "converts an arbitrary temperature from fahrenheit to celsius" do
    Temperature.new(68).degrees_celsius.should == 20
  end

  it "can be constructed in degrees celsius" do
    Temperature.from_celsius(50).degrees_celsius.should == 50
  end

  it "converts freezing from celsius to fahrenheit" do
    Temperature.from_celsius(0).degrees_fahrenheit.should == 32
  end

  it "converts boiling temperature from celsius to fahrenheit" do
    Temperature.from_celsius(100).degrees_fahrenheit.should == 212
  end

  it "converts arbitrary temperature from celsius to fahrenheit" do
    Temperature.from_celsius(20).degrees_fahrenheit.should == 68
  end

  it "converts body temperature from celsius to fahrenheit" do
    Temperature.from_celsius(37).degrees_fahrenheit.should be_within(0.1).of(98.6)
    # Why do we need to use be_within?
    # See http://www.ruby-forum.com/topic/169330
    # and http://groups.google.com/group/rspec/browse_thread/thread/f3ebbe3c313202bb
    # Also, try "puts 0.5 - 0.4 - 0.1" -- pretty crazy, right?
  end

end
