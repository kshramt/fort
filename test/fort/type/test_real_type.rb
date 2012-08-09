require 'helper_for_test'

class TestRealType < ::MiniTest::Unit::TestCase
  def setup
    @d_0 = ::Fort::Type::RealType.new(0, 64)
    @s_2 = ::Fort::Type::RealType.new(2, 32)
  end

  def test_KIND_SYM
    assert(::Fort::Type::RealType::KIND_SYM)
  end

  def test_to_s
    assert_equal(@d_0.to_s, "Real(REAL64)")
    assert_equal(@s_2.to_s, "Real(REAL32)")
  end

  def test_dim
    assert_equal(@d_0.dim, 0)
    assert_equal(@s_2.dim, 2)
  end

  def test_suf
    assert_equal(@d_0.suf, "_rD_0")
    assert_equal(@s_2.suf, "_rS_2")
  end

  def test_parenthesis
    assert_equal(@d_0.parenthesis, "")
    assert_equal(@s_2.parenthesis, "(:, :)")
  end
end
