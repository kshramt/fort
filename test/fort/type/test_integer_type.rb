require 'helper_for_test'

class TestIntegerType < ::MiniTest::Unit::TestCase
  def setup
    @d_0 = ::Fort::Type::IntegerType.new(0, 64)
    @s_2 = ::Fort::Type::IntegerType.new(2, 32)
  end

  def test_to_s
    assert_equal(@d_0.to_s, "IntegerDim0Kind64")
    assert_equal(@s_2.to_s, "IntegerDim2Kind32")
  end

  def test_declare
    assert_equal(@d_0.declare, "Integer(INT64)")
    assert_equal(@s_2.declare, "Integer(INT32), dimension(:, :)")
  end
end
