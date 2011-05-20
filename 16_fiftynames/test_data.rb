require 'faker'

class TestData
  def TestData::create_names(fileName, numNames)
    f = File.open(fileName, 'w')
    
    numNames.times {
      f.puts "name: " + Faker::Name.name
    }
    
    f.close
  end

end

