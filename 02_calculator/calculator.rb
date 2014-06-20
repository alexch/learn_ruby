def add(x, y)
	x+y
end

def multiply(*args)
	product = 1
	args.each { |arg| product*=arg }
	product
end

def subtract(x, y)
	x-y
end

def sum(array)
	total = 0
	array.each { |a| total+=a }
	total
end

def power(x, y)
	x**y
end

def factorial(n)
	1
end