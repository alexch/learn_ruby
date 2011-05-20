require "temperature"

describe Temperature do
  
  before do
    @temperature = Temperature.new
  end

  describe "#ftoc" do
    
    it "converts freezing temperature" do
      @temperature.ftoc(32).should == 0
    end
    
    it "converts boiling temperature" do
      @temperature.ftoc(212).should == 100
    end
    
    it "converts body temperature" do
      @temperature.ftoc(98.6).should == 37
    end
    
    it "converts arbitrary temperature" do
      @temperature.ftoc(68).should == 20
    end
    
  end

  describe "#ctof" do
    
    it "converts freezing temperature" do
      @temperature.ctof(0).should == 32
    end
    
    it "converts boiling temperature" do
      @temperature.ctof(100).should == 212
    end

    it "converts arbitrary temperature" do
      @temperature.ctof(20).should == 68
    end

    it "converts body temperature" do
      @temperature.ctof(37).should be_close(98.6, 0.1)
      # Why do we need to use be_close? 
      # See http://www.ruby-forum.com/topic/169330
      # and http://groups.google.com/group/rspec/browse_thread/thread/f3ebbe3c313202bb
    end
    
  end

end
