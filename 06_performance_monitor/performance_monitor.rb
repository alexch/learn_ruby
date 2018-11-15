require 'time'

def measure(amount = 1)
  average_time = 0
  amount.times do
    start_time = Time.now
    yield
    end_time = Time.now 
    average_time += end_time - start_time
  end
  average_time / amount
end
