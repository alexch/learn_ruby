here = File.expand_path(File.dirname(__FILE__))
require 'fakeweb'
require 'cnn'

describe CNN do

  before do
    @html = File.new("#{here}/cnn.html").read
    FakeWeb.register_uri(:get, "http://www.cnn.com", :body => @html)
    @news = CNN.new
  end

  it "should allow you to set the uri" do
    @news.uri = "http://www.cnn.com"
    @news.uri.should == "http://www.cnn.com"
  end

  it "should fetch the page when you set the uri" do
    @news.uri = "http://www.cnn.com"
    @news.source_data.should == @html
  end

  describe "#latest_news" do
    it "should find the first list item after 'Latest news' heading" do
      FakeWeb.register_uri(:get, "http://www.test1.com", :body => "<h4>Latest news</h4><ul><li><a href=\"http://something.com\">Story Name</a>")
      @news.uri = "http://www.test1.com"
      @news.latest_news.should ==
        {:url => "http://something.com",
         :title => "Story Name"}
    end

    it "should return the first headlines with url listed under 'Latest News'" do
      @news.uri = "http://www.cnn.com"
      @news.latest_news.should ==
        {:url => "/2010/WORLD/americas/01/31/haiti.us.airlifts/index.html?hpt=T2",
         :title => "Evacuations of Haitians to U.S. to resume"}
    end
  end
end

