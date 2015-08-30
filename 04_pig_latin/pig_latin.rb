def translate(input)
  vowel = "aeiouAEIOU"
  output = ""
  punct_check = /[[:punct:]]/.match(input)
  words = []

  if punct_check
    letters = input.split("")
    wbuild = ""
    letters.each do |c|
      if /\w/.match(c)
        wbuild += c
      else
        words.push(wbuild) if wbuild != ""
        words.push(c) if c != ""
        wbuild = ""
      end
    end
  else
    words = input.split(" ")
  end

  words.each do |term|
    if /\w/.match(term) == nil
      output += term
      next
    end

    cap = false
    if /[[:upper:]]/.match(term[0])
      cap = true
    end
    term = term.downcase
    term_letters = term.split("")

    while !vowel.include?(term_letters[0])
      if term_letters[0] + term_letters[1] == "qu"
        term_letters.push(term_letters.shift)
      end
      term_letters.push(term_letters.shift)
    end

    term_letters[0].upcase! if cap == true
    if punct_check
      output += term_letters.join("") + "ay"
    else
      output += term_letters.join("") + "ay" + " "
    end
  end

  return output.strip
end