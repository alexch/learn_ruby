class XmlDocument
  def method_missing(tag)
    "<#{tag}/>"
  end
end
