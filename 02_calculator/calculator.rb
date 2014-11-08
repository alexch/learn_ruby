# Solution to problem 02_calculator from learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 11/08/14

def add(num1, num2)
	num1 + num2
end

def subtract(num1, num2)
	num1 - num2
end

def sum(array)
	array_sum = 0
	array.each { |x| array_sum += x }	
	array_sum
end

def multiply(*nums)
	product = 1
	nums.each { |x| product *= x }
	product
end

def power(base, exp)
	base**exp
end

def factorial(integer)
	product = 1

	while (integer > 1)
		product *= integer
		integer -= 1
	end
	
	product
end
