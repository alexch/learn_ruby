require 'dictionary'

describe Dictionary do
  before do
    @d = Dictionary.new
  end
  
  it "should be empty when created" do
    @d.words == []
  end

  it "should report its contents" do 
    @d.add("fish")
    @d.add("foul")
    @d.words.sort == ["fish", "foul"].sort
  end

  it "should not include a word in an empty dictionary" do
    @d.include?('fish').should be_false
  end

  it "should not include a prefix that wasn't added as a word in and of itself" do
    @d.add('fish')
    @d.include?('fi').should be_false
  end

  it "should be able to add words" do
    @d.add('fish')
    @d.include?('fish').should be_true
  end

  it "should not find word in empty dictionary" do
    @d.find('fi').should == []
  end

  it "should find nothing if the prefix matches nothing" do
    @d.add('fiend')
    @d.add('great')
    @d.find('nothing').should == []
  end

  it "should find a word from a prefix" do
    @d.add('fish')
    @d.add('fiend')
    @d.add('great')
    @d.find('gr').should == ['great']
  end

  it "should find multiple matches from a prefix" do
    @d.add('fish')
    @d.add('fiend')
    @d.add('great')
    @d.find('fi').sort.should == ['fish', 'fiend'].sort
  end
  
  it "should find correct matches and disregard partial matches" do
    @d.add('fan')
    @d.add('fish')
    @d.add('fiend')
    @d.add('great')
    @d.find('fi').sort.should == ['fish', 'fiend'].sort
  end
end
