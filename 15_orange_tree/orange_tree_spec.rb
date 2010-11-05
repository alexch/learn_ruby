require 'orange_tree'
describe OrangeTree do
  before do
    @orange_tree = OrangeTree.new(0,6)
  end
  it "should increment the tree's age with each passing year" do
    @orange_tree.age.should == 0
    @orange_tree.height.should == 6
    @orange_tree.one_year_passes
    @orange_tree.age.should == 1
    @orange_tree.height.should == 8
  end
  
  it "should die after 80 years" do 
    @orange_tree.tree_condition.should == 'alive' 
    80.times do
      @orange_tree.one_year_passes
    end
    @orange_tree.tree_condition.should == 'dead'
  end
  
  it "should produce fruit after 2 years" do
    @orange_tree.num_oranges.should == 0
    @orange_tree.one_year_passes
    @orange_tree.num_oranges.should == 0
    @orange_tree.one_year_passes
    @orange_tree.num_oranges.should == 5
  end
  
  it "should increase fruit production by 5 pieces each year after maturity" do   
    2.times do
      @orange_tree.one_year_passes
    end
    @orange_tree.num_oranges.should == 5
    @orange_tree.one_year_passes
    @orange_tree.num_oranges.should == 10
  end
  
  it "should count the number of oranges eaten this year" do 
    2.times do
      @orange_tree.one_year_passes
    end
    @orange_tree.eat_orange(1)
    @orange_tree.oranges_eaten.should == 1
    @orange_tree.eat_orange(3)
    @orange_tree.oranges_eaten.should == 4
  end
  
  it "should not let you pick fruit that isn't there" do
    @orange_tree.eat_orange(1).should == "you can't eat an orange that isn't there.  There are 0 oranges available to eat"    
  end  
end
# age
# height
# number of oranges
# number of oranges eaten