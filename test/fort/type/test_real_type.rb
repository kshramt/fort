require 'helper_for_test'

class TestRealType < ::MiniTest::Unit::TestCase
  def setup
    @d_0 = ::Fort::Type::RealType.new(0, 64)
    @s_2 = ::Fort::Type::RealType.new(2, 32)
  end

  def test_to_s
    assert_equal(@d_0.to_s, "RealDim0Kind64")
    assert_equal(@s_2.to_s, "RealDim2Kind32")
  end

  def test_declare
    assert_equal(@d_0.declare, "Real(REAL64)")
    assert_equal(@s_2.declare, "Real(REAL32), dimension(:, :)")
  end
end
