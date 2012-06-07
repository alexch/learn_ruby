# # Topics
#
# * blocks
# * closures
# * yield
# * loops
#

require "silly_blocks"

describe "some silly block functions" do

  describe "reverser" do
    it "reverses the string returned by the default block" do
      result = reverser do
        "hello"
      end
      result.should == "olleh"
    end

    it "reverses each word in the string returned by the default block" do
      result = reverser do
        "hello dolly"
      end
      result.should == "olleh yllod"
    end
  end

  describe "adder" do
    it "adds one to the value returned by the default block" do
      adder do
        5
      end.should == 6
    end

    it "adds 3 to the value returned by the default block" do
      adder(3) do
        5
      end.should == 8
    end
  end

  describe "repeater" do
    it "executes the default block" do
      block_was_executed = false
      repeater do
        block_was_executed = true
      end
      block_was_executed.should == true
    end

    it "executes the default block 3 times" do
      n = 0
      repeater(3) do
        n += 1
      end
      n.should == 3
    end

    it "executes the default block 10 times" do
      n = 0
      repeater(10) do
        n += 1
      end
      n.should == 10
    end

  end

end
