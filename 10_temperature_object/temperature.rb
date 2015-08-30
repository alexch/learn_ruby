class Temperature
  def initialize(opt = {})
    @temp = opt
    if @temp.has_key?(:f)
      @temp[:c] = ftoc(@temp[:f])
    elsif @temp.has_key?(:c)
      @temp[:f] = ctof(@temp[:c])
    end
  end

  def in_fahrenheit
    @temp[:f]
  end

  def in_celsius
    @temp[:c]
  end

  def self.from_celsius(c)
    Temperature.new(c: c)
  end

  def self.from_fahrenheit(f)
    Temperature.new(f: f)
  end

  def ftoc(f)
    ((f - 32.0) * 5.0 / 9.0)
  end

  def ctof(c)
    ((9.0 / 5.0) * c + 32.0)
  end

end

class Celsius < Temperature
  def initialize(num)
    super(c: num)
  end
end

class Fahrenheit < Temperature
  def initialize(num)
    super(f: num)
  end
end