# This Rakefile has all the right settings to run the tests inside each lab

# Little file edition to use RSpec 3.0.0 version ( last )
gem 'rspec', '~>3'  # Use '~>2' to downgrade

require 'rspec/core/rake_task'

task :default => :spec

desc "run tests for this lab"
RSpec::Core::RakeTask.new do |task|
  lab = Rake.application.original_dir
  task.pattern = "#{lab}/*_spec.rb"
  task.rspec_opts = [ "-I#{lab}", "-I#{lab}/solution", '-f documentation', '-r ./rspec_config']
  task.verbose = false
end
