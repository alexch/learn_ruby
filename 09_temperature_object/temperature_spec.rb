require "temperature"

describe Temperature do

  describe "can be constructed" do
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


end
