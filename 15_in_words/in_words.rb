class Fixnum
  def in_words
    wordnum = {
      0 => "zero",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen",
      20 => "twenty",
      30 => "thirty",
      40 => "forty",
      50 => "fifty",
      60 => "sixty",
      70 => "seventy",
      80 => "eighty",
      90 => "ninety",
      100 => "hundred",
      1000 => "thousand",
      1000000 => "million",
      1000000000 => "billion",
      1000000000000 => "trillion"
    }

    case self
    when 0..19
      wordnum[self]
    when 20..99
      return wordnum[self] if wordnum.has_key?(self)
      ones = self % 10
      tens = self % 100 - ones
      "#{wordnum[tens]} #{wordnum[ones]}"
    when 100..999
      tens = self % 100
      hundreds = wordnum[self/100] + " " + wordnum[100]
      if self % 100 == 0
        return hundreds
      else
        "#{hundreds} #{(tens % 100).in_words}".strip
      end
    when 1000..999999
      thousands = "#{(self / 1000).in_words} #{wordnum[1000]}"
      if self % 1000 == 0
        return thousands
      else
        return "#{thousands} #{(self % 1000).in_words}".strip
      end
    when 1000000..999999999
      millions = "#{(self / 1000000).in_words} #{wordnum[1000000]}"
      if self % 1000000 == 0
        return millions
      else
        return "#{millions} #{(self % 1000000).in_words}".strip
      end
    when (10 ** 9)...(10 ** 12)
      billions = "#{(self / (10 ** 9)).in_words} #{wordnum[10 ** 9]}"
      if self % (10 ** 9) == 0
        return billions
      else
        return "#{billions} #{(self % (10 ** 9)).in_words}".strip
      end
    when (10 ** 12)...(10 ** 15)
      trillions = "#{(self / (10 ** 12)).in_words} #{wordnum[10 ** 12]}"
      if self % (10 ** 12) == 0
        return trillions
      else
        return "#{trillions} #{(self % (10 ** 12)).in_words}".strip
      end
    end
  end
end
