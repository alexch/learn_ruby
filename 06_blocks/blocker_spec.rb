require "blocker"

describe Blocker do

  it "executes a block that returns a string" do
    result = Blocker.new.execute do
      "hello"
    end
    result.should == "hello"
  end

  it "executes a block that returns a number" do
    result = Blocker.new.execute do
      3 + 4
    end
    result.should == 7
  end

  it "executes a block in the context of the calling method" do
    n = nil
    Blocker.new.execute do
      n = 7
    end
    n.should == 7
  end

  it "executes a block 3 times" do
    n = 0
    Blocker.new.execute(3) do
      n += 1
    end
    n.should == 3
  end

  it "adds one to the value returned by the block" do
    Blocker.new.add_one do
      5
    end.should == 6
  end

end
