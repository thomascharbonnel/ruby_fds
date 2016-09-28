require 'minitest/autorun'
require 'minitest/benchmark'
require 'fds'

class BenchUnorderedSet < Minitest::Benchmark
  def setup
    @fset = FDS::UnorderedSet.new
  end

  def bench_add
    assert_performance_constant 0.99 do |input|
      @fset << input
    end
  end

  def bench_find_index
    assert_performance_constant 0.99 do |input|
      @fset.find_index(input)
    end
  end
end
