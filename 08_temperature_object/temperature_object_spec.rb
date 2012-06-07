# # Topics:
# * floating-point math
# * objects
# * constructors
# * class methods
# * factory methods
# * options hashes
#
# # Hints
#
# Remember that one degree fahrenheit is 5/9 of one degree celsius, and that the freezing point of water is 0 degrees celsius but 32 degrees fahrenheit.
#
# Remember to define the `from_celsius` factory method as a *class* method, not an *instance* method.
#
# The temperature object's constructor should accept an *options hash* which contains either a `:celcius` entry or a `:fahrenheit` entry.
#
#
#

require "temperature"

describe Temperature do

  describe "can be constructed with an options hash" do
    describe "in degrees fahrenheit" do
      it "at 50 degrees" do
        Temperature.new(:f => 50).in_fahrenheit.should == 50
      end

      describe "and correctly convert to celsius" do
        it "at freezing" do
          Temperature.new(:f => 32).in_celsius.should == 0
        end

        it "at boiling" do
          Temperature.new(:f => 212).in_celsius.should == 100
        end

        it "at body temperature" do
          Temperature.new(:f => 98.6).in_celsius.should == 37
        end

        it "at an arbitrary temperature" do
          Temperature.new(:f => 68).in_celsius.should == 20
        end
      end

      describe "in degrees celsius" do
        it "at 50 degrees" do
          Temperature.new(:c => 50).in_celsius.should == 50
        end

        describe "and correctly convert to fahrenheit" do
          it "at freezing" do
            Temperature.new(:c => 0).in_fahrenheit.should == 32
          end

          it "at boiling" do
            Temperature.new(:c => 100).in_fahrenheit.should == 212
          end

          it "at body temperature" do
            Temperature.new(:c => 37).in_fahrenheit.should be_within(0.1).of(98.6)
            # Why do we need to use be_within here?
            # See http://www.ruby-forum.com/topic/169330
            # and http://groups.google.com/group/rspec/browse_thread/thread/f3ebbe3c313202bb
            # Also, try "puts 0.5 - 0.4 - 0.1" -- pretty crazy, right?
          end
        end
      end
    end
  end

  # Factory Method is a design pattern, not a Ruby language feature.
  # One way to implement this pattern in Ruby is via class methods --
  # that is, methods defined on the class (Temperature) rather than
  # on individual instances of the class.
  describe "can be constructed via factory methods" do

    it "in degrees celsius" do
      Temperature.from_celsius(50).in_celsius.should == 50
      Temperature.from_celsius(50).in_fahrenheit.should == 122
    end

    it "in degrees fahrenheit" do
      Temperature.from_fahrenheit(50).in_fahrenheit.should == 50
      Temperature.from_fahrenheit(50).in_celsius.should == 10
    end

  end

  # test-driving bonus:
  #
  # 1. make two class methods -- ftoc and ctof
  # 2. refactor to call those methods from the rest of the object
  #
  # run *all* the tests during your refactoring, to make sure you did it right
  #
  describe "utility class methods" do

  end

  # Here's another way to solve the problem!
  describe "Temperature subclasses" do
    describe "Celsius subclass" do
      it "is constructed in degrees celsius" do
        Celsius.new(50).in_celsius.should == 50
        Celsius.new(50).in_fahrenheit.should == 122
      end

      it "is a Temperature subclass" do
        Celsius.new(0).should be_a(Temperature)
      end
    end

    describe "Fahrenheit subclass" do
      it "is constructed in degrees fahrenheit" do
        Fahrenheit.new(50).in_fahrenheit.should == 50
        Fahrenheit.new(50).in_celsius.should == 10
      end

      it "is a Temperature subclass" do
        Fahrenheit.new(0).should be_a(Temperature)
      end
    end
  end

end
