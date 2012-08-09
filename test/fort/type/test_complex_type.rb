require 'helper_for_test'

class TestComplexType < ::MiniTest::Unit::TestCase
  def setup
    @d_0 = ::Fort::Type::ComplexType.new(0, 64)
    @s_2 = ::Fort::Type::ComplexType.new(2, 32)
  end

  def test_KIND_SYM
    assert(::Fort::Type::ComplexType::KIND_SYM)
  end

  def test_to_s
    assert_equal(@d_0.to_s, "Complex(REAL64)")
    assert_equal(@s_2.to_s, "Complex(REAL32)")
  end

  def test_suf
    assert_equal(@d_0.suf, "_zD_0")
    assert_equal(@s_2.suf, "_zS_2")
  end
end
