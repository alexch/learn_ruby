require "pig_latin"

describe "#translate" do
  include PigLatinTranslator

  it "translates a simple word" do
    s = translate("nix")
    s.should == "ixnay"
  end

  it "translates a word beginning with a vowel" do
    s = translate("apple")
    s.should == "appleay"
  end

  it "translates a word with two consonants" do
    s = translate("stupid")
    s.should == "upidstay"
  end

  it "translates two words" do
    s = translate("eat pie")
    s.should == "eatay iepay"
  end

  it "counts 'qu' as a single consonant" do
    s = translate("quiet")
    s.should == "ietquay"
  end

  it "translates many words" do
    s = translate("the quick brown fox")
    s.should == "ethay ickquay ownbray oxfay"
  end

end
