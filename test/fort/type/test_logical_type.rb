require 'helper_for_test'

class TestLogicalType < ::MiniTest::Unit::TestCase
  def setup
    @l0 = ::Fort::Type::LogicalType.new(0)
    @l2 = ::Fort::Type::LogicalType.new(2)
  end

  def test_to_s
    assert_equal(@l0.to_s, "Logical")
    assert_equal(@l2.to_s, "Logical")
  end

  def test_suf
    assert_equal(@l0.suf, "_l_0")
    assert_equal(@l2.suf, "_l_2")
  end
end
