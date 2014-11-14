# Solution to problem 13_xml_document from learn_ruby
# Author: Coy Sanders (coymeetsworld)
# Date: 11/14/14

class XmlDocument
	attr_accessor :doc, :indenting, :tab_counter
	def initialize(indenting=false)
		@doc = ''
		@indenting = indenting
		@tab_counter = 0
	end

	def send(tag)
		"<#{tag}/>"	
	end

	def begin_tag(tag, *args)
		str = ''
		if args.length > 0
			hsh = Hash[*args.flatten]
			hsh.each do |key, val|
				if (@indenting)
					@tab_counter.times { str.insert(0, ' ') }
					str += "<#{tag} #{key}='#{val}'/>\n"	
				else
					str= "<#{tag} #{key}='#{val}'/>"	
				end
			end
		else
			if (@indenting)
				@tab_counter.times { str.insert(0, ' ') }
				str += "<#{tag}>\n"
				@tab_counter += 2
			else
				str = "<#{tag}>"
			end
		end
		str
	end

	def end_tag(tag, *args)
		str = ''
		if (@indenting)
			@tab_counter -= 2
			@tab_counter.times { str.insert(0, ' ') }
			str += "</#{tag}>\n"
		else
			str = "</#{tag}>"
		end
		str
	end

	def method_missing(m, *args, &block)
		if args.length > 0
			@doc = begin_tag(m, *args)
		elsif block_given?
			@doc = begin_tag(m, *args)	
			@doc += block.call if block_given?
			@doc += end_tag(m)
		else
			@doc = send(m)	
		end
	end	
end

