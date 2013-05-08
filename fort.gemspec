require 'ruby_patch'

gem_name = File.basename(__DIR__)
lib = File.join(__DIR__, 'lib')
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "#{gem_name}"

Gem::Specification.new do |s|
  s.files = `git ls-files`.split
  s.name = gem_name
  s.summary = "Library for Fortran 90 and newer."
  s.version = ::Fort::VERSION
  s.add_runtime_dependency 'ruby_patch', '>= 1.1.0'
  s.add_development_dependency 'pry', '~> 0.9'
  s.author = 'kshramt'
  s.description = "Ruby library for Fortran 90 and newer."
  s.required_ruby_version = '>= 1.9'
  s.test_files.concat `git ls-files test`.split.select{|path| path =~ /test_[^\/]+.rb/}
end
