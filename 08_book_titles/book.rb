# Solution to problem 08_book_titles from learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 11/10/14

class Book
	attr_accessor :title
	def initialize
		title = ''
	end	

	def title
		exclusion_array = ["and", "in", "the", "of", "a", "an"]
		@title = @title.split.map! { |word| exclusion_array.include?(word) ? word : word.capitalize }.join(' ')
		@title.sub!(/./) { |first_letter| first_letter.upcase }
		@title
	end
	
end
