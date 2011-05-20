here = File.expand_path(File.dirname(__FILE__))

require 'fakeweb'
require 'bbc'

describe BBC do

  before do
    @html = File.new("#{here}/bbc.html").read
    FakeWeb.register_uri(:get, "http://www.bbc.com", :body => @html)
    @news = BBC.new
  end

  it "should allow you to set the uri" do
    @news.uri = "http://www.bbc.com"
    @news.uri.should == "http://www.bbc.com"
  end

  it "should fetch the page when you set the uri" do
    @news.source_data.should == ""
    @news.uri = "http://www.bbc.com"
    @news.source_data.should == @html
  end

  describe "#top_stories" do
    it "should find the first list item after 'Latest news' heading" do
      FakeWeb.register_uri(:get, "http://www.test1.com", :body => "<h4>Latest news</h4><ul><li><a href=\"http://something.com\">Story Name</a>")
      @news.uri = "http://www.test1.com"
      @news.top_stories.should ==
        {:url => "http://something.com",
         :title => "Story Name"}
    end

    it "should return the first headlines with url listed under 'Latest News'" do
      @news.uri = "http://www.bbc.com"
      @news.top_stories.should ==
        {:url => "/2010/WORLD/americas/01/31/haiti.us.airlifts/index.html?hpt=T2",
         :title => "Evacuations of Haitians to U.S. to resume"}
    end
  end
end

