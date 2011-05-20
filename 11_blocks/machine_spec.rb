require 'machine'

describe Machine do

  it "executes a block and returns a string" do
    result = Machine.new.do_something do
      "hello"
    end
    result.should == "hello"
  end

  it "executes a block and returns a number" do
    pending
    result = Machine.new.do_something do
      3 + 4
    end
    result.should == 7
  end

  it "executes a block in the context of the calling method" do 
    pending
    n = 1
    result = Machine.new.do_something do
      n + 4
    end
    result.should == 5
  end

  
  it "executes a block 3 times and returns the result" do 
    n = 5
    result = Machine.new.do_something(3) do
      n += 1
    end
    result.should == 8 
  end

end
