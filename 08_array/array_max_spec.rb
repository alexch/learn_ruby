require "array_max"

# note: these tests are not well described. 
# Without a teacher, it's hard to figure out what "should work" means...

describe ArrayMax do
  before do
    @a = ArrayMax.new
  end

  describe "#max_sub_sum" do
    it "should be zero for an empty array" do
      @a.max_sub_sum([]).should == 0
    end

    it "should work for a simple array" do
      @a.max_sub_sum([2, 3, -6, 3]).should == 5
    end

    it "should work if the required sub-array is at the end" do
      @a.max_sub_sum([1, 1, -6, 3]).should == 3
    end

    it "should work if the required sub-array is in the middle" do
      @a.max_sub_sum([1, -1, 2, 3, -4, 1]).should == 5
    end

    it "should work for a complicated array" do
      @a.max_sub_sum([4, -7, 10, -2, -1, 6, -3, 11, -8, 9, -11, 13, 14, -8, 2, -1, 5]).should == 38
    end
  end
end