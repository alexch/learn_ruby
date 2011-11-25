require "hello"

describe "the hello function" do
  it "says hello" do
    hello.should == "Hello!"
  end
end

describe "the greet function" do
  it "says hello to someone" do
    greet("Bob").should == "Hello, Bob!"
  end
end

# Test-driving bonus!
#
# Use a *default value* so that the hello function says "Hello!"
# if no parameter is passed, but "Hello, Bob!" if the parameter "Bob"
# is passed.
