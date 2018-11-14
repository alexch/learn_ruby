def echo(word)
	word
end

def shout(word)
	word.upcase
end

def repeat(word, amount = 2)
	[word] * amount * ' '
end
