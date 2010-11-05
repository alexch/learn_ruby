require 'rubygems'
require 'shoulda'
require 'pig_latin'

class PigLatinTest < Test::Unit::TestCase
  include PigLatinTranslator

  context "#translate" do

    should "translate a simple word: nix" do
      s = translate("nix")
      assert_equal("ixnay", s)
    end

    should "translate a word beginning with a vowel: apple" do
      s = translate("apple")
      assert_equal("appleay", s)
    end

    should "translate a two consonent word: stupid" do
      s = translate("stupid")
      assert_equal("upidstay", s)
    end

    should "translate two words: eat pie" do
      s = translate("eat pie")
      assert_equal("eatay iepay", s)
    end

    should "translate multiple words: the quick brown fox" do
      s = translate("the quick brown fox")
      assert_equal("ethay ickquay ownbray oxfay", s)
    end
  end
end
