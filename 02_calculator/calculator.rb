def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def sum(numlist)
  result = 0
  numlist.each do |x|
    result += x
  end
  result
end

def multiply(numlist)
  result = 1
  numlist.each do |x|
    result *= x
  end
  result
end

def power(numlist)
  numlist[0] ** numlist[1]
end

def factorial(num)
  return 1 if num == 0
  result = 1
  (1..num).each do |x|
    result *= x
  end
  result
end