require "pig_latin"

describe "#translate" do
  include PigLatinTranslator

  it "should translate a simple word" do
    s = translate("nix")
    s.should == "ixnay"
  end

  it "should translate a word beginning with a vowel" do
    s = translate("apple")
    s.should == "appleay"
  end

  it "should translate a word with two consonants" do
    s = translate("stupid")
    s.should == "upidstay"
  end

  it "should translate two words" do
    s = translate("eat pie")
    s.should == "eatay iepay"
  end

  it "should translate many words" do
    s = translate("the quick brown fox")
    s.should == "ethay ickquay ownbray oxfay"
  end

end
