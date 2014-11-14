# Solution to problem 15_in_words from learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 11/14/14

class Fixnum
	def in_words
		case self
		when 0..9
			single_digit(self)	
		when 10..99
			double_digit(self)
		end
		
	end

	def single_digit(num)
		word = ''
		case num
		when 0
			word = 'zero'
		when 1
			word = 'one'
		when 2
			word = 'two'
		when 3
			word = 'three'
		when 4
			word = 'four'
		when 5
			word = 'five'
		when 6
			word = 'six'
		when 7
			word = 'seven'
		when 8
			word = 'eight'
		when 9
			word = 'nine'
		end	
		word
	end

	def double_digit(num)
		str = ''
		if num < 20
			str = ten_through_nineteen(num)
		else
			str = tens(num - num%10)
			if num%10 != 0
				str.concat(' ' + single_digit(num%10))
			end
		end
		str
	end

	def ten_through_nineteen(num)
		word = ''
		case num
		when 10
			word = 'ten'
		when 11
			word = 'eleven'
		when 12
			word = 'twelve'
		when 13
			word = 'thirteen'
		when 14
			word = 'fourteen'
		when 15
			word = 'fifteen'
		when 16
			word = 'sixteen'
		when 17
			word = 'seventeen'
		when 18
			word = 'eighteen'
		when 19
			word = 'nineteen'
		end	
	end

	def tens(num)
		word = ''
		case num
		when 20
			word = 'twenty'
		when 30
			word = 'thirty'
		when 40
			word = 'forty'
		when 50
			word = 'fifty'
		when 60
			word = 'sixty'
		when 70
			word = 'seventy'
		when 80
			word = 'eighty'
		when 90
			word = 'ninety'
		end	
		word
	end




end

