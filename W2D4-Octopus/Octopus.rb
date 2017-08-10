### Sluggish octopus -- O(n^2)

def sluggish(array)
  loop do
    swap = false
    array.each_index do |idx|
      if array[idx].length > array[idx + 1].length
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
        swap = true
      end
    end
    break unless swap
  end
  array
end

###Dominant octopus -- O(n log n)

def dominant(array, &prc)
  prc ||= Proc.new {|a, b| a <=> b}
  return array if array.length <= 1
  mid = array.length / 2
  left = dominant(array.take(mid), &prc)
  right = dominant(array.drop(mid), &prc)
  Array.merge(left, right, &prc)
end

def merge(left, right, &prc)
  result = []
  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1
      result << left.shift
    when 0
      result << left.shift
    when 1
      result << right.shift
    end
  end
    result.concat(left)
    result.concat(right)
    result
end

###Clever octopus -- O(n)
def clever(array)
  longest = ""
  array.each {|fish| longest = fish if fish.length > longest.length}
  longest
end


###Dancing octopus -- (8 tentacles correspond to 8 posible directions)
TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left", "left-up"]


def dancing_octo(n, TILES_ARRAY)
  return TILES_ARRAY[n - 1]
end

###Slow dance -- O(n)

def slow_dance(direction, TILES_ARRAY)
  TILES_ARRAY.index(direction)
end

###Constant dance!

def constant_dance(n, TILES_ARRAY)
  hash = {}
  TILES_ARRAY.each_with_index do |el, idx|
    hash[idx] = el
  end
  hash[n]
end
