# Solution to problem 01_temperature from learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 11/08/14

def ftoc(fahrenheit_temperature)
	return (fahrenheit_temperature - 32.0) * 5.0 / 9.0
end

def ctof(celcius_temperature)
	return celcius_temperature * 9.0 / 5.0 + 32.0
end
