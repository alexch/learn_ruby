require "simon"

describe "Simon says" do
  describe "echo" do
    it "should echo hello" do
      echo("hello").should == "hello"
    end

    it "should echo bye" do
      echo("bye").should == "bye"
    end
  end

  describe "shout" do
    it "should shout hello" do
      shout("hello").should == "HELLO"
    end

    it "should shout multiple words" do
      shout("hello world").should == "HELLO WORLD"
    end
  end

  describe "repeat" do
    it "should repeat" do
      repeat("hello").should == "hello hello"
    end

    # Wait a second! How can you make the "repeat" method
    # take one *or* two arguments?
    #
    # Hint: *default values*
    it "should repeat a number of times" do
      repeat("hello", 3).should == "hello hello hello"
    end
  end

  describe "start_of_word" do
    it "returns the first letter" do
      start_of_word("hello", 1).should == "h"
    end

    it "returns the first two letters" do
      start_of_word("Bob", 2).should == "Bo"
    end

    it "returns the first several letters" do
      s = "abcdefg"
      start_of_word(s, 1).should == "a"
      start_of_word(s, 2).should == "ab"
      start_of_word(s, 3).should == "abc"
    end
  end

  describe "first_word" do
    it "tells us the first word of 'Hello World' is 'Hello'" do
      first_word("Hello World").should == "Hello"
    end

    it "tells us the first word of 'oh dear' is 'oh'" do
      first_word("oh dear").should == "oh"
    end
  end

  describe "capitalize and titleize" do
    it "capitalizes a word" do
      capitalize("obama").should == "Obama"
    end

    it "only capitalizes the first letter of a multi-word string" do
      capitalize("barack obama").should == "Barack obama"
    end

    it "should capitalize every word (aka title case)" do
      titleize("barack obama").should == "Barack Obama"
    end
  end

end
