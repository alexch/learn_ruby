require "array_sum"

describe Array do
  it "has a #sum method" do
    [].should respond_to(:sum)
  end

  it "sums an empty array" do
    [].sum.should == 0
  end

  it "sums an array with numbers in it" do
    [1,2,3].sum.should == 6
  end

end
