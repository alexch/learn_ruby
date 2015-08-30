class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    hr = (@seconds / 3600).to_s
    min = ((@seconds / 60) % 60).to_s
    sec = (@seconds % 60).to_s
    output = "#{hr.rjust(2, "0")}:#{min.rjust(2, "0")}:#{sec.rjust(2, "0")}"
  end
end