# Solution to problem 09_timer learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 11/10/14

class Timer

	attr_accessor :seconds

	def initialize
		@seconds = 0
	end

	def seconds(s = nil)
		if s.nil?
			@seconds = 0
		else
			@seconds = s
		end
	end
		
	def time_string
		mins = @seconds/60
		secs = @seconds%60
		hrs  = mins/60
		mins = mins%60

		"%02d" % hrs + ":" + "%02d" % mins + ":" + "%02d" % secs
	end

end

