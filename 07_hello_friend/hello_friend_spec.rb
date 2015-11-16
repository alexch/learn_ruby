# # Hello, friend!
#
# This lab teaches basic Ruby Object syntax.
#
# ## Watch it fail
#
# Your first real failure should be something like this:
#
#     ./friend_spec.rb:3: uninitialized constant Friend (NameError)
#
# Fix this by opening `friend.rb` and creating an empty class:
#
#     class Friend
#     end
#
# Save it. Run the test again.
#
# ## Watch it fail again
#
# Now you should see an error like this:
#
#     NoMethodError in 'Friend says hello'
#     undefined method `greeting' for #<Friend:0x1180f3c>
#     ./friend_spec.rb:5:
#
# This means that while it found the file, and it found the class, it couldn't find the method named "greeting".
#
# ## Define the "greeting" method
#
# In `friend.rb`, add the following inside the class (before the "end").
#
#     def greeting
#     end
#
# Save it. Run the test again.
#
# ## Watch it fail some more
#
# Now you should see an error like this:
#
#     'Friend says hello' FAILED
#     expected: "Hello!",
#          got: nil (compared using ==)
#     ./friend_spec.rb:5:
#
# This means that there is a method, but it's not returning anything! ("nil" is the Ruby way of saying "not anything".)
#
# ## Make it return something
#
# Inside the "greeting" method, put a single line containing a string that is *not* "Hello!". (Here we are simulating you making an honest mistake, so we can see what the error message looks like.)
#
#     def greeting
#       "whuh?"
#     end
#
# Save it. Run the test again.
#
# ## Watch it fail yet again
#
# Now you should see an error like this:
#
#     'Friend says hello' FAILED
#     expected: "Hello!",
#          got: "whuh?" (compared using ==)
#     ./friend_spec.rb:5:
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
# Fix the next failure! :-)
#
# Hint 1: in order to get the next test to pass, you will need to pass a *parameter*:
#
#     def greeting(who)
#
# Hint 2: once you do that, the **first** test might start failing again. To fix both at the same time, you need to provide a **default value** for that parameter:
#
#     def greeting(who = nil)
#
#

require "friend"

describe Friend do
  it "says hello" do
    expect(Friend.new.greeting).to eq("Hello!")
  end

  it "says hello to someone" do
    expect(Friend.new.greeting("Bob")).to eq("Hello, Bob!")
  end
end
