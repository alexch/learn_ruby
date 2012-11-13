# # Hello!
#
# This lab teaches basic Ruby function syntax.
#
# ## Open a terminal in this directory
#
#     cd 00_hello
#
# This directory is the starting point for this exercise. It contains a spec file and you'll be adding a ruby file to (eventually) make the specs pass.
#
# ## Run the test
#
#     rake
#
# ## Watch it fail
#
# You should see an error. **Don't get scared!** Try to read it and figure out what the computer wants to tell you. Somewhere on the first line it should say something like
#
#     no such file to load -- test-first-teaching/hello/hello (LoadError)
#
# That means that it is looking for a file called `hello.rb` and can't find it.
#
# ## Create hello.rb
#
# Open up `hello.rb` in a text editor. Save it. Run the test again.
#
#     rake
#
# ## Watch it fail
#
# Now you should see an error like this:
#
#     the hello function
#       says hello (FAILED - 1)
#
#     Failures:
#
#       1) the hello function says hello
#          Failure/Error: hello.should == "Hello!"
#          NameError:
#            undefined local variable or method `hello' for #<RSpec::Core::ExampleGroup::Nested_1:0x000001009b8808>
#          # ./hello/hello_spec.rb:5:in `block (2 levels) in <top (required)>'
#
# ## Create the hello function
#
# Fix this by opening `hello.rb` and creating an empty function:
#
#     def hello
#     end
#
# Save it. Run the test again.
#
# ## Watch it fail
#
# Now you should see an error like this:
#
#     the hello function
#       says hello (FAILED - 1)
#
#     Failures:
#
#       1) the hello function says hello
#          Failure/Error: hello().should == "Hello!"
#            expected: "Hello!"
#                 got: nil (using ==)
#          # ./hello/hello_spec.rb:5:in `block (2 levels) in <top (required)>'
#
# This means that while it found the file, and it found the function, it's not returning anything! ("nil" is the Ruby way of saying "not anything".)
#
# ## Make it return something
#
# Inside the "hello" function, put a single line containing a string that is *not* "Hello!". (Here we are simulating you making an honest mistake, so we can see what the error message looks like.)
#
#     def hello
#       "whuh?"
#     end
#
# Save it. Run the test again.
#
# ## Watch it fail
#
# Now you should see an error like this:
#
#     1) the hello function says hello
#        Failure/Error: hello().should == "Hello!"
#          expected: "Hello!"
#               got: "whuh?" (using ==)
#        # ./hello/hello_spec.rb:5:in `block (2 levels) in <top (required)>'
#
# Correct this by changing "whuh?" to "Hello!". Save it. Run the test again.
#
# ## Watch it pass!
#
# Hooray! Finally! It works!
#
# ## Give yourself a high five
#
# Also, sing a song and do a little dance.
#
# ## And then...
#
# Fix the next failure! `:-)`
#
#     the hello function
#       says hello
#
#     the greet function
#       says hello to someone (FAILED - 1)
#
# In order to get the next test to pass, your function will need to accept an *argument*.
#
#     def greet(who)
#       "Hello, #{who}!"
#     end
#
require "hello"

describe "the hello function" do
  it "says hello" do
    hello.should == "Hello!"
  end
end

describe "the greet function" do
  it "says hello to someone" do
    greet("Alice").should == "Hello, Alice!"
  end

  it "says hello to someone else" do
    greet("Bob").should == "Hello, Bob!"
  end
end
