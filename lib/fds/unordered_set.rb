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

  [:to_s, :first, :last, :to_a].each do |function|
    class_eval(<<-EOF, __FILE__, __LINE__ + 1)
      def #{function}
        @data.keys.#{function}
      end
    EOF
  end

  alias_method :<<, :add
end
