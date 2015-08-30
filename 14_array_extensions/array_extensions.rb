class Array

  def sum
    return 0 if self.empty?
    return self.inject { |sum, x| sum + x }
  end

  def square
    return self if self.empty?
    return self.map { |x| x ** 2 }
  end

  def square!
    return self if self.empty?
    return self.map! { |x| x ** 2 }
  end
end
