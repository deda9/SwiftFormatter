class Node
  attr_reader :value
  attr_accessor :next
  attr_accessor :previous

  def initialize(value)
    @value = value
    @next = nil
    @previous = nil
  end
end

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if @head == nil
      @head = node
    else
      if @head.next == nil
        @head.next = node
      end
      node.previous = @tail
      @tail.next = node
    end
    @tail = node
  end

  def find(value)
    current = @head
    while current != nil
      if current.value == value
        return current
      else
        current = @head.next
      end
    end
  end

end
