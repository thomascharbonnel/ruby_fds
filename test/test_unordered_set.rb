require 'minitest/autorun'
require 'set'
require 'fds'
require 'fds/unordered_set'

class UnorderedSetTest < Minitest::Test
  # Let's compare with the default Set class.
  def setup
    @fset = FDS::UnorderedSet.new
    @set = Set.new
  end

  def test_insertion_of_one_integer
    @fset << 42
    @set << 42

    assert_equal @fset.first, @set.first
  end

  def test_insertion_of_multiple_different_integers
    @fset << 42 << 24
    @set << 42 << 24

    assert_equal @fset.to_a, @set.to_a
  end
end
