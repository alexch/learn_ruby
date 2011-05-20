require "friend"

describe Friend do
  it "says hello" do
    Friend.new.greeting.should == "Hello!"
  end

  it "says hello to someone" do
    Friend.new.greeting("Bob").should == "Hello, Bob!"
  end
end
