require 'helper_for_test'

class TestCharacterType < ::MiniTest::Unit::TestCase
  def setup
    @cAst_0 = ::Fort::Type::CharacterType.new(0, '*')
    @cColon_1 = ::Fort::Type::CharacterType.new(1, ':')
    @c3_2 = ::Fort::Type::CharacterType.new(2, 3)
  end

  def test_to_s
    assert_equal(@cAst_0.to_s, "CharacterDim0LenAst")
    assert_equal(@cColon_1.to_s, "CharacterDim1LenColon")
    assert_equal(@c3_2.to_s, "CharacterDim2Len3")
  end

  def test_declare
    assert_equal(@cAst_0.declare, "Character(len = *)")
    assert_equal(@cColon_1.declare, "Character(len = :), dimension(:)")
    assert_equal(@c3_2.declare, "Character(len = 3), dimension(:, :)")
  end
end
