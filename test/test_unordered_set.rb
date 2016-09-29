require 'minitest/autorun'
require 'set'
require 'fds'

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

  def test_insertion_of_multiple_identical_and_different_integers
    @fset << 42 << 24 << 42
    @set << 42 << 24 << 42

    assert_equal @fset.to_a, @set.to_a
  end

  def test_deletion_of_all_items_should_give_empty_set
    @fset << 1 << 2 << 3
    @set << 1 << 2 << 3

    @fset.delete(1).delete(2).delete(3)
    @set.delete(1).delete(2).delete(3)

    assert_equal(@fset.size, @set.size)
    assert_equal(@fset.first, nil)
    assert_equal(@fset.last, nil)
  end

  def test_union_of_two_sets
    fset1 = FDS::UnorderedSet.new
    set1 = Set.new

    @fset0 << 1 << 2 << 3
    @set0 << 1 << 2 << 3
    fset1 << 3 << 4 << 5
    set1 << 3 << 4 << 5

    fset = @fset0 | fset1
    set = @set0 | set1

    assert_equal(fset.to_a, set.to_a)
  end

  def test_intersection_of_two_sets
    fset1 = FDS::UnorderedSet.new
    set1 = Set.new

    @fset0 << 1 << 2 << 3
    @set0 << 1 << 2 << 3
    fset1 << 3 << 4 << 5
    set1 << 3 << 4 << 5

    fset = @fset0 & fset1
    set = @set0 & set1

    assert_equal(fset.to_a, set.to_a)
  end
end
