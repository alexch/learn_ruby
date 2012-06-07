# # Topics
#
# * method_missing
# * blocks
# * strings
# * hashes
#
# # Builder
#
# Here we will implement the so-called Builder Pattern: we will make an object, XmlDocument, that *builds* an XML file, which can contain arbitrary tags.

# Stuff you'll learn:
# method_missing
# nested closures
# "builder pattern"

require "xml_document"

describe XmlDocument do
  before do
    @xml = XmlDocument.new
  end

  it "renders an empty tag" do
    @xml.hello.should == "<hello/>"
  end

  it "renders a tag with attributes" do
    @xml.hello(:name => 'dolly').should == "<hello name='dolly'/>"
  end

  it "renders a randomly named tag" do
    tag_name = (1..8).map{|i| ('a'..'z').to_a[rand(26)]}.join
    @xml.send(tag_name).should == "<#{tag_name}/>"
  end

  it "renders block with text inside" do
    @xml.hello do
      "dolly"
    end.should == "<hello>dolly</hello>"
  end

  it "nests one level" do
    @xml.hello do
      @xml.goodbye
    end.should == "<hello><goodbye/></hello>"
  end

  it "nests several levels" do
    xml = XmlDocument.new
    xml.hello do
      xml.goodbye do
        xml.come_back do
          xml.ok_fine(:be => "that_way")
        end
      end
    end.should == "<hello><goodbye><come_back><ok_fine be='that_way'/></come_back></goodbye></hello>"
  end

  it "indents" do
    @xml = XmlDocument.new(true)
    @xml.hello do
      @xml.goodbye do
        @xml.come_back do
          @xml.ok_fine(:be => "that_way")
        end
      end
    end.should ==
    "<hello>\n" +
    "  <goodbye>\n" +
    "    <come_back>\n" +
    "      <ok_fine be='that_way'/>\n" +
    "    </come_back>\n" +
    "  </goodbye>\n" +
    "</hello>\n"
  end
end
