require 'helper_for_test'

class TestLogicalType < ::MiniTest::Unit::TestCase
  def setup
    @l0 = ::Fort::Type::LogicalType.new(0)
    @l2 = ::Fort::Type::LogicalType.new(2)
  end

  def test_to_s
    assert_equal(@l0.to_s, "LogicalDim0")
    assert_equal(@l2.to_s, "LogicalDim2")
  end

  def test_declare
    assert_equal(@l0.declare, "Logical")
    assert_equal(@l2.declare, "Logical, dimension(:, :)")
  end
end
