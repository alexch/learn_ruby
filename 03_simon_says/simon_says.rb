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
