class Temperature
  def initialize(options = {})
    @options = options
  end

  def in_fahrenheit
    @options[:f] = 50
  end

  def in_celsius
    @options[:f] = (@options[:f] - 32) * 5.0/9.0
  end
end
