def translate(s)
	vowels = %w(a e i o u)
	consonants = %(b c d f g h j k l m n p q r s t v w x y z)

	s = s.split.map do |word|
		if vowels.include?(word[0])
			word.concat("ay")
		end
		
		while consonants.include?(word[0])
			if word[0..1] == "qu"
				word.concat("qu")
				word = word[2..-1]
				word = word + "ay"
			else
				word.concat(word[0])
				word = word[1..-1]
				word = word + "ay" if vowels.include?(word[0])
			end
		end
		word
	end
	s.join(' ')
end
