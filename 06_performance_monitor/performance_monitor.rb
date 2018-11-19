require 'time'

def measure(amount = 1)
  total_time = 0
  amount.times do
    start_time = Time.now
    yield
    end_time = Time.now 
    total_time += end_time - start_time
  end
  average_time = total_time / amount
end
