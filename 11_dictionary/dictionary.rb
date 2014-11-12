# Solution to problem 11_dictionary from learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 11/12/14

class Dictionary
	attr_accessor :entries
	
	def initialize
		@entries = {}
	end

	def add(entry)

		if entry.kind_of?(Hash)
			entry.each do |key, val|
				@entries[key] = val
			end
		elsif entry.kind_of?(String)
			# Adding the word, but not the definition
			@entries[entry] = nil
		end

	end

	def keywords
		keywords = []
		@entries.each_key do |key|
			keywords.push(key)
		end
		keywords.sort
	end

	def include?(entry)
		@entries.each_key do |key|
			if (key == entry)
				return true
			end
		end
		false
	end

	def find(entry)
		matching_records = {}
		@entries.each_key do |key|
			if (key =~ /^#{entry}/)
				matching_records[key] = @entries[key]
			end
		end
		return matching_records
	end

	def printable
		printable_str = ''
		@entries.sort.map do |key, value|
			printable_str += "[#{key}] \"#{@entries[key]}\"\n"
		end
		printable_str.chop
	end
end

