require 'rake'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/*_test.rb'

  t.verbose = !!ENV["VERBOSE"]
  t.warning = !!ENV["WARNING"]
end

Rake::TestTask.new('test:rl') do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/really/*_test.rb'

  t.verbose = !!ENV["VERBOSE"]
  t.warning = !!ENV["WARNING"]
end

desc "Run tests"
task :default => :test

