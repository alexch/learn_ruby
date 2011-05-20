require "temperature"

describe Temperature do

  it "can be constructed in degrees fahrenheit" do
    Temperature.new(50).degrees_fahrenheit.should == 50
  end

  it "converts freezing from fahrenheit to celcius" do
    Temperature.new(32).degrees_celcius.should == 0
  end

  it "converts boiling from fahrenheit to celcius" do
    Temperature.new(212).degrees_celcius.should == 100
  end

  it "converts body temperature from fahrenheit to celcius" do
    Temperature.new(98.6).degrees_celcius.should == 37
  end

  it "converts an arbitrary temperature from fahrenheit to celcius" do
    Temperature.new(68).degrees_celcius.should == 20
  end

  it "can be constructed in degrees celcius" do
    Temperature.from_celcius(50).degrees_celcius.should == 50
  end

  it "converts freezing from celcius to fahrenheit" do
    Temperature.from_celcius(0).degrees_fahrenheit.should == 32
  end

  it "converts boiling temperature from celcius to fahrenheit" do
    Temperature.from_celcius(100).degrees_fahrenheit.should == 212
  end

  it "converts arbitrary temperature from celcius to fahrenheit" do
    Temperature.from_celcius(20).degrees_fahrenheit.should == 68
  end

  it "converts body temperature from celcius to fahrenheit" do
    Temperature.from_celcius(37).degrees_fahrenheit.should be_within(0.1).of(98.6)
    # Why do we need to use be_within?
    # See http://www.ruby-forum.com/topic/169330
    # and http://groups.google.com/group/rspec/browse_thread/thread/f3ebbe3c313202bb
    # Also, try "puts 0.5 - 0.4 - 0.1" -- pretty crazy, right?
  end

end
