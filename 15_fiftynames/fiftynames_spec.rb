require 'test_data'
require 'faker'

describe "TestData" do
  before do
    @fname = "datafile.txt"
    @num_names = 2
    File.delete @fname if File.exists? @fname
  end

  describe "basic behavior" do
    before do
      TestData.create_names(@fname, @num_names)
    end
    
    it "creates a file" do
      File.should exist @fname
    end

    it "creates a file with the right number of lines" do
      num_lines = 0
      File.open(@fname, "r") do |f|
        f.each { num_lines += 1 }
      end
      num_lines.should == @num_names
    end

    it "writes lines with correct format" do
      File.open(@fname, "r") do |f|
        correct_format = f.all? do |line|
          md = line.match(/name: (\w+) (\w+)/)
          md.should_not be_nil
          md.length.should == 3 unless md.nil?
        end
        correct_format.should == true 
      end
    end
  end

  it "creates a file with names using Faker gem" do
    Faker::Name.stub(:name).and_return("Mary Smith", "Bob Roberts")
    TestData.create_names(@fname, @num_names)
    File.open(@fname, "r") do |f|
      f.gets.should == "name: Mary Smith\n"
      f.gets.should == "name: Bob Roberts\n"
    end

  end


end
