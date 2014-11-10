# Solution to problem 07_hello_friend from learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 11/10/14

class Friend

	def greeting(name = nil)
		if name.nil?
			"Hello!"
		else
			"Hello, #{name}!"
		end
	end

end


