# Solution to problem 14_array_extensions from learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 11/14/14

class Array

	def sum
		sum = 0
		self.each do |val|
			sum += val
		end
		sum
	end	

	def square
		self.map { |val| val*=val }
	end

	def square!
		self.map! { |val| val*=val }
	end

end

