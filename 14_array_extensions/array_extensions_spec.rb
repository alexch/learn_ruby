# # Array Extension
#
# # Topics
#
# * objects, methods, classes
# * reopening classes
#

require_relative "array_extensions" # we don't call it "array.rb" since that would be confusing

describe Array do
  describe "#sum" do
    it "has a #sum method" do
      expect([]).to respond_to(:sum)
    end

    it "should be 0 for an empty array" do
      expect([].sum).to eql(0)
    end

    it "should add all of the elements" do
      expect([1,2,4].sum).to eql(7)
    end
  end

  describe '#square' do
    it "does nothing to an empty array" do
      expect([].square).to eql([])
    end

    it "returns a new array containing the squares of each element" do
      expect([1,2,3].square).to eql([1,4,9])
    end
  end

  describe '#square!' do
    it "squares each element of the original array" do
      array = [1,2,3]
      array.square!
      expect(array).to eql([1,4,9])
    end
  end
end
