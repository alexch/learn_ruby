class XmlDocument
  attr_reader :xml

  def initialize
  end
  
  def method_missing(method, attributes = {}, &block)
    xml = ''
    tag = method.to_s
    attributes_string = ''

    attributes.each { |k, v| attributes_string += " #{k}='#{v}'" }
    xml += "<#{tag + attributes_string}/>"

    xml
  end
end
