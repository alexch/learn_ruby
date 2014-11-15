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

require_relative "in_words"

describe Fixnum do

  it "reads 0 to 9" do
    expect(0.in_words).to eql('zero')
    expect(1.in_words).to eql('one')
    expect(2.in_words).to eql('two')
    expect(3.in_words).to eql('three')
    expect(4.in_words).to eql('four')
    expect(5.in_words).to eql('five')
    expect(6.in_words).to eql('six')
    expect(7.in_words).to eql('seven')
    expect(8.in_words).to eql('eight')
    expect(9.in_words).to eql('nine')
  end

  it "reads 10 to 12" do
    expect(10.in_words).to eql('ten')
    expect(11.in_words).to eql('eleven')
    expect(12.in_words).to eql('twelve')
  end

  it "reads teens" do
    expect(13.in_words).to eql('thirteen')
    expect(14.in_words).to eql('fourteen')
    expect(15.in_words).to eql('fifteen')
    expect(16.in_words).to eql('sixteen')
    expect(17.in_words).to eql('seventeen')
    expect(18.in_words).to eql('eighteen')
    expect(19.in_words).to eql('nineteen')
  end

  it "reads tens" do
    expect(20.in_words).to eql('twenty')
    expect(30.in_words).to eql('thirty')
    expect(40.in_words).to eql('forty')
    expect(50.in_words).to eql('fifty')
    expect(60.in_words).to eql('sixty')
    expect(70.in_words).to eql('seventy')
    expect(80.in_words).to eql('eighty')
    expect(90.in_words).to eql('ninety')
  end

  it "reads various other numbers less than 100" do
    expect(20.in_words).to eql('twenty')
    expect(77.in_words).to eql('seventy seven')
    expect(99.in_words).to eql('ninety nine')
  end

  it "reads hundreds" do
    expect(100.in_words).to eql('one hundred')
    expect(200.in_words).to eql('two hundred')
    expect(300.in_words).to eql('three hundred')
    expect(123.in_words).to eql('one hundred twenty three')
    expect(777.in_words).to eql('seven hundred seventy seven')
    expect(818.in_words).to eql('eight hundred eighteen')
    expect(512.in_words).to eql('five hundred twelve')
    expect(999.in_words).to eql('nine hundred ninety nine')
  end

  it "reads thousands" do
    expect(1000.in_words).to eql('one thousand')
    expect(32767.in_words).to eql('thirty two thousand seven hundred sixty seven')
    expect(32768.in_words).to eql('thirty two thousand seven hundred sixty eight')
  end

  it "reads millions" do
    expect(10_000_001.in_words).to eql('ten million one')
  end

  it "reads billions" do
    expect(1_234_567_890.in_words).to eql('one billion two hundred thirty four million five hundred sixty seven thousand eight hundred ninety')
  end

  it "reads trillions" do
    expect(1_000_000_000_000.in_words).to eql('one trillion')
    expect(1_000_000_000_001.in_words).to eql('one trillion one')
    expect(1_888_259_040_036.in_words).to eql('one trillion eight hundred eighty eight billion two hundred fifty nine million forty thousand thirty six')
  end

end
