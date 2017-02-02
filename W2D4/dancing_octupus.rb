tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(item, arr)
  arr.each_with_index { |el, i| return i if el == item }
end

def constant_dance(item, arr)
  arr.index(item)
end
