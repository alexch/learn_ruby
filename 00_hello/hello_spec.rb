require "hello"

describe "the hello function" do
  it "says hello" do
    hello.should == "Hello!"
  end
  
  it "says hello to someone" do
    hello("Bob").should == "Hello, Bob!"
  end
end
