class RPNCalculator
  def initialize
    @stack = []
  end

  def push(num)
    @stack.push(num)
  end

  def plus
    raise "calculator is empty" if @stack.length < 2
    @stack.push(@stack.pop + @stack.pop)
  end

  def minus
    raise "calculator is empty" if @stack.length < 2
    num1 = @stack.pop
    num2 = @stack.pop
    @stack.push(num2 - num1)
  end

  def divide
    raise "calculator is empty" if @stack.length < 2
    num1 = @stack.pop.to_f
    num2 = @stack.pop.to_f
    @stack.push(num2 / num1)
  end

  def times
    raise "calculator is empty" if @stack.length < 2
    num1 = @stack.pop.to_f
    num2 = @stack.pop.to_f
    @stack.push(num2 * num1)
  end

  def value
    @stack.last
  end

  def tokens(string)
    result = string.split(" ").map do |x|
      if x.match(/[+-\/*]/)
        x.to_sym
      else
        x.to_i
      end
    end
    result
  end

  def evaluate(string)
    tokens(string).each do |token|
      if token.is_a?(Integer)
        push(token)
      elsif token.is_a?(Symbol)
        case token
          when :+
            plus
          when :-
            minus
          when :/
            divide
          when :*
            times
        end
      end
    end

    value
  end
end
