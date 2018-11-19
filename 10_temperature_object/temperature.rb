class Temperature
  def initialize(options)
    @celsius    = options[:c]
    @fahrenheit = options[:f]
  end

  def in_fahrenheit
    return @fahrenheit unless @fahrenheit.nil?
    @celsius.to_f * 9/5 + 32
  end

  def in_celsius
    return @celsius unless @celsius.nil?
    (@fahrenheit.to_f - 32) * 5/9
  end
end
