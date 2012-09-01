# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "url2png-dc"
  gem.homepage = "http://github.com/nowk/url2png-dc"
  gem.license = "MIT"
  gem.summary = %Q{Url2Png Gem .v6}
  gem.description = %Q{Gem to use Url2Png}
  gem.email = "yung.kwon@damncarousel.com"
  gem.authors = ["Yung Hwa Kwon"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/*_test.rb'
  test.verbose = !!ENV["VERBOSE"]
  test.warning = !!ENV["WARNING"]
end
Rake::TestTask.new('test:rl') do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/really/*_test.rb'
  t.verbose = !!ENV["VERBOSE"]
  t.warning = !!ENV["WARNING"]
end

task :default => :test
