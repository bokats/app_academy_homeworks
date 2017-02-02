fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
        'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fish)
  i = 0
  longest = ""

  while i < fish.length
    j = i + 1
    while j < fish.length
      if fish[i].length > fish[j].length
        comp = fish[i]
      else
        comp = fish[j]
      end
      if comp.length > longest.length
        longest = comp
      end
      j += 1
    end
    i += 1
  end
  longest
end

def dominant_octupus_sort(arr)

  return [arr] if arr.length < 2
  pivot = arr.first

  left, right = [], []
  arr[1..-1].each do |f|
    if f.length < pivot.length
      left << f
    else
      right << f
    end
  end

  dominant_octupus_sort(left) + [pivot] + dominant_octupus_sort(right)
end

def dominant_octupus(arr)
  dominant_octupus_sort(arr).last
end

def clever_octopus(arr)

  longest = arr.first
  arr.each do |fish|
    if fish.length > longest.length
      longest = fish
    end
  end
  longest
end
