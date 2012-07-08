module Fort
  require 'fort/version'
  require 'ruby_patch'
  extend ::RubyPatch::AutoLoad

  MustNotHappen = Class.new(Exception)
end
