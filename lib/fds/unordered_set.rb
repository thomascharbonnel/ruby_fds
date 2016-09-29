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
    @data.each { |k, v| yield k }
  end

  def include?(e)
    find_index(e) != nil
  end

  # Could probably use some metaprogramming
  def delete_if
    @data.each do |k, v|
      @data.delete(k) if yield(k)
    end
    self
  end

  def keep_if
    @data.each do |k, v|
      @data.delete(k) unless yield(k)
    end
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

  [:to_s, :first, :last, :to_a].each do |function|
    class_eval(<<-EOF, __FILE__, __LINE__ + 1)
      def #{function}
        @data.keys.#{function}
      end
    EOF
  end

  alias_method :<<, :add
  alias_method :union, :|
  alias_method :intersection, :&
end
