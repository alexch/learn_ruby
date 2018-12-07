class TagBuilder
  def with_name(name)
    @name = name
  end

  def with_attributes(attributes)
    @attributes = attributes
  end

  def with_content(content)
    @content = content
  end

  def prettify
    @pretty = true
  end

  def build
    tokens = []
    tokens << "<#{@name}"
    tokens << @attributes.map { |k, v| " #{k}='#{v}'" }

    if @content.nil?
      tokens << '/>'
    else
      tokens << add_content
    end
    tokens.join
  end

  private
  def add_content
    tokens = []
    tokens << '>' << format(@content) << "</#{@name}>"
    tokens << "\n" if @pretty
    tokens
  end

  def format(content)
    tokens = []
    unless @pretty
      tokens << content  
    else
      pretty_content = content.split("\n")
        .map { |line| "  #{line}" }
        .join("\n")
      tokens << "\n" << pretty_content << "\n"
    end
    tokens
  end
end 
