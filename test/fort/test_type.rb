require 'helper_for_test'

class TestType < ::MiniTest::Unit::TestCase
  def test_USE_ISO_FORTRAN_ENV
    assert(::Fort::Type::USE_ISO_FORTRAN_ENV)
  end
end
