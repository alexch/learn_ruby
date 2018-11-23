class XmlDocument
  def initialize(indented=false)
    @xml = ""
    @indented = indented
    @level = 0
  end

  def method_missing(method, attributes = {}, &block)
    @xml =''
    tag = method.to_s
    attributes_string = ""

    attributes.each { |k, v| attributes_string += " #{k}='#{v}'" }
    @xml += "<#{tag + attributes_string}>"

    if block_given?
      format if @indented
      @xml += "#{yield}</#{tag}>"
      format(true) if @indented
    else
      @xml.gsub!(/>$/, "/>")
      format(true) if @indented
    end
    @xml
  end

  def format(end_tag=false)
    @level += 1 unless end_tag
    @level -= 1 if end_tag && @level > 0
    @xml += "\n" + "  " * @level
  end
end
