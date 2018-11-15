def reverser
  result = yield.split.map { |word|
    word.reverse
  }.join(" ")
end

def adder

end
