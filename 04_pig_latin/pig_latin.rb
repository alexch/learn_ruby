def translate(phrase)
	vowels = /[aeiou]/
	consonants = /[b-df-hj-np-tv-z]/
	
	doVowel = proc { |word| word.concat("ay") if vowels.match(word[0]) }

	phrase = phrase.split.map do |word|
		doVowel.call(word)
		while consonants.match(word[0])
			if word[0..1] == "qu"
				word.concat("qu")
				word = word[2..-1]
				word.concat("ay")
			else
				word.concat(word[0])
				word = word[1..-1]
				doVowel.call(word)
			end
		end
		word
	end
	phrase.join(' ')
end
