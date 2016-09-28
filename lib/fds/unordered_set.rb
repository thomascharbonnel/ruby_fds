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

  def remove(e)
    @data.delete(e)
    self
  end

  def size
    @data.size
  end

  [:to_s, :first, :last, :to_a].each do |function|
    define_method function do
      @data.keys.send(function)
    end
  end

  alias_method :<<, :add
  alias_method :+, :add # Should probably try to copy original Set behaviour
  alias_method :rm, :remove
  alias_method :del, :remove
  alias_method :delete, :remove
end
