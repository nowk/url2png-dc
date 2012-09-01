# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "url2png-dc"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yung Hwa Kwon"]
  s.date = "2012-09-01"
  s.description = "Gem to use Url2Png"
  s.email = "yung.kwon@damncarousel.com"
  s.files = [
    ".rvmrc",
    "Gemfile",
    "Gemfile.lock",
    "Rakefile",
    "VERSION",
    "lib/url2png/cache.rb",
    "lib/url2png/configuration.rb",
    "lib/url2png/url_helper.rb",
    "lib/url2png_dc.rb",
    "test/cache_test.rb",
    "test/configuration_test.rb",
    "test/really/make_call_to_url2png_test.rb",
    "test/test_helper.rb",
    "test/url2png_dc_test.rb",
    "test/url_helper_test.rb",
    "url2png-dc.gemspec"
  ]
  s.homepage = "http://github.com/nowk/url2png-dc"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Url2Png Gem .v6"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<turn>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<turn>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<turn>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

