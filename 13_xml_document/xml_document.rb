class XmlDocument
  def method_missing(method, attributes = {}, &block)
    xml = ''
    tag = method.to_s
    attributes_string = ''

    attributes.each { |k, v| attributes_string += " #{k}='#{v}'" }
    xml += "<#{tag + attributes_string}>"

    if block_given?
      xml += "#{yield}</#{tag}>"
    else
      xml.gsub!(/>/, "/>")
    end

    xml
  end
end
