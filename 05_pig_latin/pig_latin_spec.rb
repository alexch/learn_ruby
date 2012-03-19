require "pig_latin"

describe "#translate" do

  it "translates a simple word" do
    s = translate("nix")
    s.should == "ixnay"
  end

  it "translates a word beginning with a vowel" do
    s = translate("apple")
    s.should == "appleay"
  end

  it "translates two words" do
    s = translate("eat pie")
    s.should == "eatay iepay"
  end

  it "translates a word with two consonants" do
    s = translate("stupid")
    s.should == "upidstay"
  end

  it "gloms several consonants in a row" do
    translate("three").should == "eethray"
  end

  it "counts 'qu' as a single phoneme" do
    s = translate("quiet")
    s.should == "ietquay"
  end

  it "counts 'sch' as a single phoneme" do
    s = translate("school")
    s.should == "oolschay"
  end

  it "translates many words" do
    s = translate("the quick brown fox")
    s.should == "ethay ickquay ownbray oxfay"
  end

  # Test-driving bonus:
  # * write a test asserting that capitalized words are still capitalized (but with a different initial capital letter, of course)
  # * retain the punctuation from the original phrase

end
