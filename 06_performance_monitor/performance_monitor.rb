def measure(n = 1)
  dt = 0
  n.times do
    t1 = Time.now
    #puts t1
    yield
    t2 = Time.now
    #puts t2
    dt += t2 - t1
  end
  dt /= n
end