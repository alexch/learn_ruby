def add(a, b)
    a + b
end

def subtract(a, b)
    a - b
end

def sum(arr)
    arr.inject(0, :+)
end

def multiply(*numbers)
    numbers.inject(1, :*)
end
