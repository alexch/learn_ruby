class XmlDocument
  def initialize
  end

  def hello(attr = {})
    key = attr.keys.first.to_s
    value = attr[attr.keys.first]
    if attr.size == 0
      "<hello/>"
    else
      "<hello #{key}='#{value}'/>"
    end
  end
end
