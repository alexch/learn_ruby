# This Rakefile has all the right settings to run the tests inside each chapter
gem 'rspec', '~>2'
require 'rspec/core/rake_task'

task :default => :spec

desc "run tests for this chapter"
RSpec::Core::RakeTask.new do |task|
  chapter = Rake.application.original_dir
  task.pattern = "#{chapter}/*_spec.rb"
  task.rspec_opts = [ "-I#{chapter}", "-I#{chapter}/solution", '-f documentation', '-r ./rspec_config', '--color']
  task.verbose = false
end
