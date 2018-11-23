class XmlDocument
  def initialize(pretty=false)
    @xml = ""
    @pretty = pretty
    @level = 0
  end

  def method_missing(method, attributes = {}, &block)
    @xml = ""
    tag = method.to_s
 
    append_tag_to_xml(tag, attributes)

    if block_given?
      indent if @pretty
      @xml += "#{yield}</#{tag}>"
      indent(true) if @pretty
    else
      format_to_self_closing
    end
    @xml
  end

  def indent(end_tag=false)
    @level += 1 unless end_tag
    @level -= 1 if end_tag && @level > 0
    @xml += "\n" + "  " * @level
  end

  def append_tag_to_xml(tag, attributes)
    attributes_string = ""
    attributes.each { |k, v| attributes_string += " #{k}='#{v}'" }
    @xml += "<#{tag + attributes_string}>"
  end

  def format_to_self_closing
    @xml.gsub!(/>/, "/>")
    indent(true) if @pretty
  end
end
