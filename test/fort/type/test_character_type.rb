require 'helper_for_test'

class TestCharacterType < ::MiniTest::Unit::TestCase
  def setup
    @cAst_0 = ::Fort::Type::CharacterType.new(0, '*')
    @cColon_1 = ::Fort::Type::CharacterType.new(1, ':')
    @c3_2 = ::Fort::Type::CharacterType.new(2, 3)
  end

  def test_to_s
    assert_equal(@cAst_0.to_s, "Character(len = *)")
    assert_equal(@cColon_1.to_s, "Character(len = :)")
    assert_equal(@c3_2.to_s, "Character(len = 3)")
  end

  def test_dim
    assert_equal(@cAst_0.dim, 0)
    assert_equal(@cColon_1.dim, 1)
    assert_equal(@c3_2.dim, 2)
  end

  def test_suf
    assert_equal(@cAst_0.suf, '_cAst_0')
    assert_equal(@cColon_1.suf, '_cColon_1')
    assert_equal(@c3_2.suf, '_c3_2')
  end
end
