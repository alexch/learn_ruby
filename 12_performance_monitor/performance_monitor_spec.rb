require "performance_monitor"

describe PerformanceMonitor do
  before do
    @monitor = PerformanceMonitor.new
  end
  
  it "takes about 0 seconds to run an empty block" do
    @monitor.run do
    end.should be_close(0, 0.1)
  end

  it "takes exactly 0 seconds to run an empty block (with stubs)" do
    Time.stub!(:now).and_return(100)
    @monitor.run do
    end.should == 0
  end

  it "takes about 1 second to run a block that sleeps for 1 second" do
    @monitor.run do
      sleep 1
    end.should be_close(1, 0.1)
  end

  it "takes exactly 1 second to run a block that sleeps for 1 second (with stubs)" do
    fake_time = 100
    Time.stub!(:now).and_return {fake_time}
    @monitor.run do
      fake_time += 1
    end.should == 1
  end

  it "runs a block N times" do
    n = 0
    @monitor.run(4) do
      n += 1
    end
    n.should == 4
  end
  
  it "returns the average time, not the total time, when running multiple times" do
    run_times = [8,6,5,7]
    run_index = 0
    fake_time = 100
    Time.stub(:now).and_return { fake_time }
    @monitor.run(4) do
      fake_time += run_times[run_index]
      run_index += 1
    end.should == 6
  end

end
