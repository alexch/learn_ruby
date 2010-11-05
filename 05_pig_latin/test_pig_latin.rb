require 'test/unit'
require 'pig_latin'
 
class PigLatinTest < Test::Unit::TestCase
    include PigLatinTranslator
 
    def test_simple_word
        s = translate("nix")
        assert_equal("ixnay", s, "'nix' translation failed")
    end
 
    def test_word_beginning_with_vowel
        s = translate("apple")
        assert_equal("appleay", s, "'apple' translation failed")
    end
 
    def test_two_consonant_word
        s = translate("stupid")
        assert_equal("upidstay", s, "'stupid' translation failed")
    end
 
    def test_two_words
        s = translate("eat pie")
        assert_equal("eatay iepay", s, "'eat pie' translation failed")
    end
    
    def test_qu_counts_as_a_consonant
        s = translate("quiet")
        assert_equal("ietquay", s, "'quiet' translation failed")
    end
    
    def test_multiple_words
        s = translate("the quick brown fox")
        assert_equal("ethay ickquay ownbray oxfay", s,
            "'the quick brown fox' translation failed")
    end
 
end
 

