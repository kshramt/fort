require 'helper_for_test'

class TestIntegerType < ::MiniTest::Unit::TestCase
  def setup
    @d_0 = ::Fort::Type::IntegerType.new(0, 64)
    @s_2 = ::Fort::Type::IntegerType.new(2, 32)
  end

  def test_KIND_SYM
    assert(::Fort::Type::IntegerType::KIND_SYM)
  end

  def test_to_s
    assert_equal(@d_0.to_s, "Integer(INT64)")
    assert_equal(@s_2.to_s, "Integer(INT32)")
  end

  def test_suf
    assert_equal(@d_0.suf, "_iD_0")
    assert_equal(@s_2.suf, "_iS_2")
  end
end
