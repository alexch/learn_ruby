# # Topics:
# * functions
# * floating-point math
#
# # Hints
#
# Remember that one degree fahrenheit is 5/9 of one degree celsius, and that the freezing point of water is 0 degrees celsius but 32 degrees fahrenheit.
#
# In integer math, there **are no fractions**. So if you are using integer literals, you will be using integer math, which means, for example...
#
#    1 / 2 => 0
#
# In floating point math, there **are** fractions. So...
#
#    1.0 / 2.0 => 0.5
#

require "temperature"

describe "temperature conversion functions" do

  describe "#ftoc" do

    it "converts freezing temperature" do
      ftoc(32).should == 0
    end

    it "converts boiling temperature" do
      ftoc(212).should == 100
    end

    it "converts body temperature" do
      ftoc(98.6).should == 37
    end

    it "converts arbitrary temperature" do
      ftoc(68).should == 20
    end

  end

  describe "#ctof" do

    it "converts freezing temperature" do
      ctof(0).should == 32
    end

    it "converts boiling temperature" do
      ctof(100).should == 212
    end

    it "converts arbitrary temperature" do
      ctof(20).should == 68
    end

    it "converts body temperature" do
      ctof(37).should be_within(0.1).of(98.6)
      # Why do we need to use be_within?
      # See http://www.ruby-forum.com/topic/169330
      # and http://en.wikipedia.org/wiki/IEEE_754-2008
      # and http://en.wikipedia.org/wiki/Double_precision_floating-point_format
      # Also, try "puts 0.5 - 0.4 - 0.1" -- pretty crazy, right?
    end

  end

end
