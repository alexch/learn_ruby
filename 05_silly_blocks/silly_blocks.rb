def reverser
  result = yield.split.map { |word|
    word.reverse
  }.join(" ")
end

def adder(num = 1)
  yield + num
end

def repeater(amount = 1)
  amount.times do 
    yield
  end
end
