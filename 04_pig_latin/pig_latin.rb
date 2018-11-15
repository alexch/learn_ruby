def translate(phrase)
	vowels = /[aeiou]/
	consonants = /[b-df-hj-np-tv-z]/

	phrase = phrase.split.map do |word|
		word.concat("ay") if vowels.match(word[0])
		
		while consonants.match(word[0])
			if word[0..1] == "qu"
				word.concat("qu")
				word = word[2..-1]
				word.concat("ay")
			else
				word.concat(word[0])
				word = word[1..-1]
				word.concat("ay") if vowels.match(word[0])
			end
		end
		word
	end
	phrase.join(' ')
end
