require 'helper_for_test'

class TestFort < ::MiniTest::Unit::TestCase
  def test_VERSION
    assert(::Fort::VERSION)
  end
end
