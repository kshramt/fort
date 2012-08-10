require 'helper_for_test'

class TestComplexType < ::MiniTest::Unit::TestCase
  def setup
    @d_0 = ::Fort::Type::ComplexType.new(0, 64)
    @s_2 = ::Fort::Type::ComplexType.new(2, 32)
  end

  def test_to_s
    assert_equal(@d_0.to_s, "ComplexDim0Kind64")
    assert_equal(@s_2.to_s, "ComplexDim2Kind32")
  end

  def test_declare
    assert_equal(@d_0.declare, "Complex(REAL64)")
    assert_equal(@s_2.declare, "Complex(REAL32), dimension(:, :)")
  end
end
