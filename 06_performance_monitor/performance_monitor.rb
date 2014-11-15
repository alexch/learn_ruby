# Solution to problem 06_performance_monitor from learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 11/09/14

def measure(iterations=1)
	begin_time = Time.now	

	ret_val = nil	

	iterations.times do
		ret_val = yield
	end
		
	if ret_val.nil?
		ret_val = 0
	end

	end_time = Time.now
	(end_time - begin_time) / iterations
	
end
