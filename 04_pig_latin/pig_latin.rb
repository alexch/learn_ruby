# Solution to problem 04_pig_latin from learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 11/08/14

def translate(str)

	words = str.split
	words.each do |word|

		if word[0] =~ /[A-Z]/
			capped = true
			word.downcase!
		end

		if word[0] =~ /[aeiou]/
			word.concat("ay")
		elsif word =~ /qu/
			arr = word.partition(/qu/)	

			#square => s qu are
			#quail => qu ail

			if (arr[0] != 'qu')
				word.replace(arr[2].concat(arr[0] + arr[1] + "ay"))
			else
				word.replace(arr[2].concat(arr[1] + "ay"))
			end
		else 
			arr = word.partition(/[aeiou]/)
			word.replace(arr[1].concat(arr[2] + arr[0] + "ay"))
		end

		if capped
			word.capitalize!
		end
	end

	words.join(' ')
end
