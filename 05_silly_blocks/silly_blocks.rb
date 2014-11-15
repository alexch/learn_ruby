# Solution to problem 05_silly_blocks from learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 11/08/14

#blocks
#closures
#yields
#loops

# Another solution with passing the block
#def reverser(&someBlock)
#	someBlock.call.split.map!{|word| word.reverse}.join(' ')
#end

def reverser()
	str = yield
	str.split.map!{|word| word.reverse}.join(' ')
end

def adder(num=1)
	x = yield
	x.to_i + num
end

def repeater(iterations=1)
	iterations.times do 
		yield
	end
end
