require 'test_helper'

class TypeTest < ::MiniTest::Unit::TestCase
  T = ::Fort::Type

  def test_different_ids_for_different_types
    assert(not(T::Real.provide(dim: 1, kind: :REAL32).id == T::Complex.provide(dim: 1, kind: :REAL32).id))
  end

  def test_different_ids_for_different_hashs
    assert(not(T::Real.provide(dim: 1, kind: :REAL32).id == T::Real.provide(dim: 1, kind: :REAL64).id))
    assert(not(T::Real.provide(dim: 1, kind: :REAL32).id == T::Real.provide(dim: 1, kind: :REAL32, dummy: :dummy).id))
  end

  def test_same_id_for_same_type_and_hash
    assert(T::Real.provide(dim: 1, kind: :REAL32).id == T::Real.provide(kind: :REAL32, dim: 1).id)
  end

  def test_base
    assert_equal('BaseDim3', T::Base.provide(dim: 3).to_s)
    assert_equal('Base, dimension(:, :, :)', T::Base.provide(dim: 3).declare)
  end

  def test_numeric
    t = T::Numeric.provide(dim: 0, kind: 1)
    assert_equal('NumericDim0Kind1', t.to_s)
    assert_equal('Numeric(kind = 1)', t.declare)
  end

  def test_multi_provide
    assert_equal(8, T::Logical.multi_provide(dim: (0..7)).size)
    assert_equal(21, T::Numeric.multi_provide(dim: [1, 2, 3, 4, 5, 6, 7], kind: [:REAL32, :REAL64, :REAL128]).size)
  end

  def test_integer
    t = T::Integer.provide(dim: 7, kind: :INT32)
    assert_equal('IntegerDim7KindINT32', t.to_s)
    assert_equal('Integer(kind = INT32), dimension(:, :, :, :, :, :, :)', t.declare)
  end

  def test_real
    t = T::Real.provide(dim: 1, kind: :REAL128)
    assert_equal('RealDim1KindREAL128', t.to_s)
    assert_equal('Real(kind = REAL128), dimension(:)', t.declare)
  end

  def test_complex
    t = T::Complex.provide(dim: 1, kind: :REAL128)
    assert_equal('ComplexDim1KindREAL128', t.to_s)
    assert_equal('Complex(kind = REAL128), dimension(:)', t.declare)
  end

  def test_character
    t = T::Character.provide(dim: 1, len: 2)
    assert_equal('CharacterDim1Len2', t.to_s)
    assert_equal('Character(len = 2), dimension(:)', t.declare)
  end

  def test_character_asterisk
    t = T::Character.provide(dim: 1, len: :*)
    assert_equal('CharacterDim1LenAsterisk', t.to_s)
    assert_equal('Character(len = *), dimension(:)', t.declare)
  end

  def test_character_colon
    t = T::Character.provide(dim: 1, len: :':')
    assert_equal('CharacterDim1LenColon', t.to_s)
    assert_equal('Character(len = :), dimension(:)', t.declare)
  end

  def test_logical
    t = T::Logical.provide(dim: 1)
    assert_equal('LogicalDim1', t.to_s)
    assert_equal('Logical, dimension(:)', t.declare)
  end
end
