def translate(s)
    vowels = %w(a e i o u)
    consonants = %(b c d f g h j k l m n p q r t v w x y z)

    if vowels.include?(s[0])
        s.concat("ay")
    end

    while consonants.include?(s[0]) 
        s = s.concat(s[0])
        s = s[1..-1]
        s = s + "ay" if vowels.include?(s[0])
    end
    s
end