# # Topics
#
# * strings and numbers
# * modules
# * reopening classes
#
# # Extending a built-in class
#
# To make this test pass you'll need to extend a built-in class. You'll see that we're creating a new spec for 'Fixnum' -- this isn't a new class you'll be building, but instead it is a built-in class you will extend.
#
# Remember that in Ruby, everything is an object, even a number.  Try this in irb:
#
#     >> 4.class
#     => Fixnum
#     >> 4.methods
#     \["inspect", "%", "<<", ...
#
# The number 4 is of class `FixNum` and it has methods on it.  Your challenge is to add an `in_words` method to `FixNum`.
#

require "in_words"

describe Fixnum do

  it "reads 0 to 9" do
    0.in_words.should == 'zero'
    1.in_words.should == 'one'
    2.in_words.should == 'two'
    3.in_words.should == 'three'
    4.in_words.should == 'four'
    5.in_words.should == 'five'
    6.in_words.should == 'six'
    7.in_words.should == 'seven'
    8.in_words.should == 'eight'
    9.in_words.should == 'nine'
  end

  it "reads 10 to 12" do
    10.in_words.should == 'ten'
    11.in_words.should == 'eleven'
    12.in_words.should == 'twelve'
  end

  it "reads teens" do
    13.in_words.should == 'thirteen'
    14.in_words.should == 'fourteen'
    15.in_words.should == 'fifteen'
    16.in_words.should == 'sixteen'
    17.in_words.should == 'seventeen'
    18.in_words.should == 'eighteen'
    19.in_words.should == 'nineteen'
  end

  it "reads tens" do
    20.in_words.should == 'twenty'
    30.in_words.should == 'thirty'
    40.in_words.should == 'forty'
    50.in_words.should == 'fifty'
    60.in_words.should == 'sixty'
    70.in_words.should == 'seventy'
    80.in_words.should == 'eighty'
    90.in_words.should == 'ninety'
  end

  it "reads various other numbers less than 100" do
    20.in_words.should == 'twenty'
    77.in_words.should == 'seventy seven'
    99.in_words.should == 'ninety nine'
  end

  it "reads hundreds" do
    100.in_words.should == 'one hundred'
    200.in_words.should == 'two hundred'
    300.in_words.should == 'three hundred'
    123.in_words.should == 'one hundred twenty three'
    777.in_words.should == 'seven hundred seventy seven'
    818.in_words.should == 'eight hundred eighteen'
    512.in_words.should == 'five hundred twelve'
    999.in_words.should == 'nine hundred ninety nine'
  end

  it "reads thousands" do
    1000.in_words.should == 'one thousand'
    32767.in_words.should == 'thirty two thousand seven hundred sixty seven'
    32768.in_words.should == 'thirty two thousand seven hundred sixty eight'
  end

  it "reads millions" do
    10_000_001.in_words.should == 'ten million one'
  end

  it "reads billions" do
    1_234_567_890.in_words.should == 'one billion two hundred thirty four million five hundred sixty seven thousand eight hundred ninety'
  end

  it "reads trillions" do
    1_000_000_000_000.in_words.should == 'one trillion'
    1_000_000_000_001.in_words.should == 'one trillion one'
    1_888_259_040_036.in_words.should == 'one trillion eight hundred eighty eight billion two hundred fifty nine million forty thousand thirty six'
  end

end
