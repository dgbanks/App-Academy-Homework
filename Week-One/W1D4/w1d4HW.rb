class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end

end




class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end

end




class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    if @map.empty? || @map.none? {|arr| arr[0] == key}
      @map << [key, value]
    else
      @map.map {|arr| arr[1] = value if arr[0] == key}
    end
    return @map
  end

  def lookup(key)
    @map.detect {|arr| return arr[1] if arr[0] == key}
  end

  def remove(key)
    @map.reject! {|arr| arr[0] == key}
  end

  def show
    @map
  end

end
#
# my_stack = Stack.new
# p my_stack.add(3)
# p my_stack.show
# p my_stack.add([2, 4, 6])
# p my_stack.show
# p my_stack.remove
# p my_stack.show
#
# myq = Queue.new
# p myq.enqueue(4)
# p myq.enqueue(8)
# p myq.enqueue(10)
# p myq.show
# p myq.dequeue
# p myq.show

# mymap = Map.new
# p mymap.assign(4, 3)
# p mymap.show
# p mymap.assign(7, 2)
# p mymap.show
# p mymap.assign(4, 6)
# p mymap.show
# p mymap.lookup(7)
# p mymap.remove(7)
# p mymap.show
