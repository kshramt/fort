module Fort
  require 'fort/version'
  require 'ruby_patch'
  extend ::RubyPatch::AutoLoad

  MustNotHappen = Class.new(Exception)
  INTRINSIC_MODULES = [
                       :ieee_arithmetic,
                       :ieee_exceptions,
                       :ieee_features,
                       :iso_c_binding,
                       :iso_fortran_env]
end
