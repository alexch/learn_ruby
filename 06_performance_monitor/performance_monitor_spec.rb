# # Topics
#
# * stubs
#    -what are stubs? [Rspec Documentation]( https://github.com/rspec/rspec-mocks#method-stubs )
#    -Further Explanation: [Requisite StackOverflow]( http://stackoverflow.com/questions/14326000/what-exactly-does-time-stubnow-fake-time-do#14326239 )
#
# * blocks
#
# * yield
#
#
# # Performance Monitor
#
# This is (a stripped down version of) an actual useful concept: a function that runs a block of code and then tells you how long it took to run.

require "performance_monitor"

# loads up the Time.parse method -- do NOT create time.rb!
# http://ruby-doc.org/core-2.3.1/Time.html
require "time"


describe "Performance Monitor" do
  before do
    @eleven_am = Time.parse("2011-1-2 11:00:00")
  end

  it "takes about 0 seconds to run an empty block" do
    elapsed_time = measure do
    end
    expect(elapsed_time).to be_within(0.1).of(0)
  end

  it "takes exactly 0 seconds to run an empty block (with stubs)" do
    ## has been updated with Rspec 3.  The now form syntax is:
    # old:
    # Time.stub(:now).and_return( @eleven_am )
    # new: 
    allow(Time).to receive(:now).and_return( @eleven_am)
    

    elapsed_time = measure do
    end
    expect(elapsed_time).to eql(0.0)
  end

  it "takes about 0.1 second to run a block that sleeps for 0.1 second" do
    elapsed_time = measure do
      sleep 0.1
    end
    expect(elapsed_time).to be_within(0.01).of(0.1)
  end

  it "takes exactly 1 second to run a block that sleeps for 1 second (with stubs)" do
    fake_time = @eleven_am
    allow(Time).to receive(:now) { fake_time }

    elapsed_time = measure do
      fake_time += 60.0  # adds one minute to fake_time
    end
    expect(elapsed_time).to be_within(0.01).of( 60.0)
  end

  it "runs a block N times" do
    @n = 0
    measure(4) do
      @n += 1
    end
    expect(@n).to eql(4)
  end

  it "returns the average time, not the total time, when running multiple times" do
    run_times = [8,6,5,7]
    @fake_time = @eleven_am
    allow(Time).to receive(:now) { @fake_time }

    average_time = measure(4) do
      @fake_time += run_times.pop
    end
    expect(average_time).to eql( 6.5)
  end

  it "returns the average time when running a random number of times for random lengths of time" do
    fake_time = @eleven_am
    allow(Time).to receive(:now) { fake_time }
    number_of_times = rand(10) + 2
    average_time = measure(number_of_times) do
      delay = rand(10)
      fake_time += delay
    end
    expect(average_time).to eql((fake_time - @eleven_am).to_f/number_of_times)
  end

end
