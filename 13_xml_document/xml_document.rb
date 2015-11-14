class XmlDocument
  def initialize(indent = false)
    @indent = indent
    @indent_count = 0
  end

  def method_missing(method, hash = {}, &block)
    result = ""

    if hash.empty? && block.nil?
      @indent ? ("  " * @indent_count) + "<#{method}/>\n" : "<#{method}/>"
    elsif !hash.empty?
      key = hash.keys.first.to_s
      val = hash[hash.keys.first]
      @indent ? "<#{method} #{key}='#{val}'/>\n" : "<#{method} #{key}='#{val}'/>"
    else
      if @indent
        result << "<#{method}>\n"
        @indent_count += 1
        result << ("  " * @indent_count) + "#{yield}"
        @indent_count -= 1
        result << ("  " * @indent_count) + "</#{method}>\n"
        return result
      else
        "<#{method}>#{yield}</#{method}>"
      end
    end
  end
=begin
  Found a really cool way to do this using method_missing in ruby!
  Source: http://stackoverflow.com/questions/29567635/what-distinguishes-new-from-newtrue-indent-xml-document-in-test-first-rub


  Explanation of &block in ruby
  Source: http://mixandgo.com/blog/mastering-ruby-blocks-in-less-than-5-minutes

  The code below were my previous efforts in doing this exercise without the knowledge of method_missing. Preserved for posterity.
=end

=begin
  def hello(attr = {})
    key = attr.keys.first.to_s
    value = attr[attr.keys.first]
    if block_given?
      return @indent ?  "<hello>\n" + yield + "</hello>\n" : "<hello>" + yield + "</hello>"
    elsif attr.size == 0
      "<hello/>"
    else
      "<hello #{key}='#{value}'/>"
    end
  end

  def send(name)
    "<#{name}/>"
  end

  def goodbye
    if block_given?
      "<goodbye>" + yield + "</goodbye>"
    else
      "<goodbye/>"
    end
  end

  def come_back
    if block_given?
      "<come_back>" + yield + "</come_back>"
    else
      "<comeback/>"
    end
  end

  def ok_fine(attr = {})
    key = attr.keys.first.to_s
    value = attr[attr.keys.first]
    if block_given?
      "<ok_fine>" + yield + "</ok_fine>"
    elsif attr.size == 0
      "<ok_fine/>"
    else
      "<ok_fine #{key}='#{value}'/>"
    end
  end
=end
end
