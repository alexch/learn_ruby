# # Topics
#
# * modules
# * strings
#
# # Pig Latin
#
# Pig Latin is a made-up children's language that's intended to be confusing. It obeys a few simple rules (below) but when it's spoken quickly it's really difficult for non-children (and non-native speakers) to understand.
#
# Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
#
# Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the word.
#
# (There are a few more rules for edge cases, and there are regional variants too, but that should be enough to understand the tests.)
#
# See <http://en.wikipedia.org/wiki/Pig_latin> for more details.
#
#

require_relative "pig_latin"

describe "#translate" do

	it "translates a word beginning with a vowel" do
		expect(translate("apple")).to eql("appleay")
	end

	it "translates a word beginning with a consonant" do
		expect(translate("banana")).to eql("ananabay")
	end

	it "translates a word beginning with two consonants" do
		expect(translate("cherry")).to eql("errychay")
	end

	it "translates two words" do
		expect(translate("eat pie")).to eql("eatay iepay")
	end

	it "translates a word beginning with three consonants" do
		expect(translate("three")).to eql("eethray")
	end

	it "counts 'sch' as a single phoneme" do
		expect(translate("school")).to eql("oolschay")
	end

	it "counts 'qu' as a single phoneme" do
		expect(translate("quiet")).to eql("ietquay")
	end

	it "counts 'qu' as a consonant even when it's preceded by a consonant" do
		expect(translate("square")).to eql("aresquay")
	end

	it "translates many words" do
		expect(translate("the quick brown fox")).to eql("ethay ickquay ownbray oxfay")
	end

  # Test-driving bonus:
  # * write a test asserting that capitalized words are still capitalized (but with a different initial capital letter, of course)
  # * retain the punctuation from the original phrase

	it "Capitilize test #1" do
		expect(translate("Apple")).to eql("Appleay")
	end

	it "Capitilize test #2" do
		expect(translate("Banana")).to eql("Ananabay")
	end

	it "Capitilize test #3" do
		expect(translate("Cherry")).to eql("Errychay")
	end

	it "Capitilize test #4" do
		expect(translate("Eat Pie")).to eql("Eatay Iepay")
	end

	it "Capitilize test #5" do
		expect(translate("Three")).to eql("Eethray")
	end

	it "Capitilize test #6" do
		expect(translate("School")).to eql("Oolschay")
	end

	it "Capitilize test #7" do
		expect(translate("Quiet")).to eql("Ietquay")
	end

	it "Capitilize test #8" do
		expect(translate("Square")).to eql("Aresquay")
	end

	it "Capitilize test #9" do
		expect(translate("The quick Brown fox")).to eql("Ethay ickquay Ownbray oxfay")
	end

end
