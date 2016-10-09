class FDS::UnorderedSet
  def initialize
    @index = 0
    @data = Hash.new do |h, e|
      h[e] = @index
      @index += 1
    end
  end

  def add(e)
    @data[e]
    self
  end

  def find_index(e)
    # @data.has_key? is needed otherwise @data will create a new element,
    # see @data definition in #initialize.
    @data[e] if @data.has_key?(e)
  end

  def delete(e)
    @data.delete(e)
    self
  end

  def size
    @data.size
  end

  def each
    @data.each_key(&proc)
  end

  def include?(e)
    find_index(e) != nil
  end

  def delete_if
    @data.delete_if { |k, _| yield k }
    self
  end

  def keep_if
    @data.keep_if { |k, _| yield k }
    self
  end

  def |(other)
    if self.size > other.size
      result = self.dup
      smaller_set = other
    else
      result = other.dup
      smaller_set = self
    end

    smaller_set.each do |e|
      result << e
    end

    result
  end

  def &(other)
    if self.size < other.size
      result = self.dup
      bigger_set = other
    else
      result = other.dup
      bigger_set = self
    end

    result.keep_if do |e|
      bigger_set.include?(e)
    end

    result
  end

  def first
    @data.each_key { |k| return k }
    nil
  end

  def last
    # All keys are read through, but no intermediate array is created as
    # whereas "keys.last" accumulates all keys for nothing.
    # We can't use @data.each_key.last, because there's no Enumerable#last. :/
    @data.reverse_each { |k, _| return k }
    nil
  end

  def to_a
    @data.keys
  end

  def to_s
    to_a.to_s
  end

=begin
  [:to_s, :first, :last, :to_a].each do |function|
    class_eval(<<-EOF, __FILE__, __LINE__ + 1)
      def #{function}
        @data.keys.#{function}
      end
    EOF
  end
=end

  alias_method :<<, :add
  alias_method :union, :|
  alias_method :intersection, :&
end
