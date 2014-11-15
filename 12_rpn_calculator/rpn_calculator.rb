# Solution to problem 12_rpn_calculator from learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 11/13/14

class RPNCalculator

	attr_accessor :stack, :value

	def initialize
		@stack = []
		@value = 0
	end

	def push(token)
		@stack.push(token)
	end

	def plus
	  raise "calculator is empty"	unless enough_values
		@value = @stack.pop + @stack.pop
		@stack.push(@value)
	end

	def minus
	  raise "calculator is empty"	unless enough_values
		operands = @stack.pop(2)
		@value = operands[0] - operands[1]
		@stack.push(@value)
	end

	def divide
	  raise "calculator is empty"	unless enough_values
		operands = @stack.pop(2)
		@value = operands[0].to_f / operands[1].to_f
		@stack.push(@value)
	end

	def times
	  raise "calculator is empty"	unless enough_values
		@value = @stack.pop * @stack.pop
		@stack.push(@value)
	end


	#Tokenizes a string into an array
	def tokens(str)
		arr = str.split
		arr.map! { |token| token =~ /[\*\-\/\+]/ ? token.to_sym : token }
		arr.map! { |token| token =~ /[0-9]/ ? token.to_i : token }
		arr	
	end

	def evaluate(str)
		arr = str.split
		arr.each do |item|
			case item
				when "+"
					plus
				when "-"
					minus
				when "*"
					times
				when "/"
					divide
				else
					@stack.push(item.to_i)
			end
		end		
		@value
	end

private
	def enough_values
		@stack.length > 1
	end

end
