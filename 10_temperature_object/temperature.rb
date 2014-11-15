# Solution to problem 10_temperature_object from learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 11/11/14

class Temperature
	attr_accessor :f, :c
	
	def initialize(params = {})
		 params.each { |k,v| instance_variable_set("@#{k}", v) }
	end

	def in_fahrenheit
		f.nil? ? ctof(c) : f
	end

	def in_celsius
		c.nil? ? ftoc(f) : c
	end

	def self.from_celsius(c)
		 Temperature.new({:c => c})
	end

	def self.from_fahrenheit(f)
		 Temperature.new({:f => f})
	end

	private

		def ftoc(f)
			((f - 32) * 5.0 / 9.0)
		end

		def ctof(c)
			(c * 9.0 / 5.0 + 32)
		end
	
end

class Celsius < Temperature
	def initialize(c)
		super({:c => c})
	end
end

class Fahrenheit < Temperature
	def initialize(f)
		super({:f => f})
	end
end
