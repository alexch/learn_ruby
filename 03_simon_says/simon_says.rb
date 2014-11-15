# Solution to problem 03_simon_says from learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 11/08/14

def echo(word)
	word
end

def shout(word)
	word.upcase
end

def repeat(word, number=2)
	phrase = ''
	number.times do
		phrase += "#{word} "
	end
	phrase.strip
end

def start_of_word(word, num_letters=1)
	word[0..num_letters-1]
end

def first_word(word)
	words = word.split
	words[0]
end

def titleize(phrase)
	exclusion_array = ["and", "or", "the", "over", "to", "the", "a", "but"]
	phrase = phrase.split.map! { |word| exclusion_array.include?(word) ? word : word.capitalize }.join(' ')
	phrase.sub!(/./) {|first_letter| first_letter.upcase }
	phrase
end
