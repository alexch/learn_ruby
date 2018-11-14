def echo(word)
	word
end

def shout(word)
	word.upcase
end

def repeat(word, amount = 2)
	[word] * amount * ' '
end

def start_of_word(word, first_letters)
	word[0..first_letters-1]
end

def first_word(words)
	words.split[0]
end

def titleize(words)
	words = words.split.map do |word|
		if %w(and the over).include?(word)
			word
		else
			word.capitalize
		end
	end
	words.first.capitalize!
	words.join(' ')
end
