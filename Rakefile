require 'ruby_patch'
require 'rake/testtask'

::Rake::TestTask.new do |t|
  t.libs = ['lib', 'test'].map{|dir| File.join(__DIR__, dir)}
  t.pattern = "test/**/test_*.rb"
end
