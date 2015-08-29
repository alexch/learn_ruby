def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word, num = 2)
  ((word + " ") * num).strip
end

def start_of_word(word, length = 1)
  word[0..(length-1)]
end

def first_word(words)
  words.split(" ")[0]
end

def titleize(words)
  result = words.split(" ").each_with_index do |word, index|
  little_words = ["and", "a", "or", "the", "over"]
    if little_words.include?(word) && index != 0
      next
    else
      word[0] = word[0].upcase
    end
  end
  result.join(" ")
end