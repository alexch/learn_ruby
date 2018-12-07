require 'tag_builder'

class XmlDocument
  def initialize(pretty=false)
    @pretty = pretty
  end

  def method_missing(method, attributes = {}, &block)
    tag_builder = TagBuilder.new

    tag_builder.with_name(method.to_s)
    tag_builder.with_attributes(attributes)
    tag_builder.with_content(yield) if block_given?
    tag_builder.prettify if @pretty

    tag_builder.build
  end
end
