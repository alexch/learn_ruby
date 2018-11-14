def add(a, b)
	a + b
end

def subtract(a, b)
  a - b
end

def sum(arr)
  arr.inject(0, :+)
end

def multiply(*numbers)
  numbers.inject(1, :*)
end

def power(a, b)
  a ** b
end

def factorial(n)
	return 1 if n == 0
	n * factorial(n - 1)
end
