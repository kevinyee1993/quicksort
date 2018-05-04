class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length == 1

    left = []
    right = []
    pivot = array.shift

    array.each do |el|
      if el <= pivot
        left << el
      else
        right << el
      end
    end

    Quicksort.sort1(left) + [pivot] + Quicksort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new{|x,y| x <=> y}

    return array if length < 2
    pivot = partition(array, start, length, &prc)
    left_length = pivot - start
    right_length = length - (left_length + 1)

    sort2!(array, start, left_length, &prc)
    sort2!(array, pivot + 1, right_length, &prc)

    return array
  end

  def self.partition(array, start, length, &prc)

    prc ||= Proc.new{|x,y| x <=> y}
    pivot = array[start]
    pivot_idx = start

    for i in start + 1...start + length

      # if array[i] <= pivot && !found_big
      if prc.call(pivot, array[i]) > 0
        array[i], array[pivot_idx+1] = array[pivot_idx+1], array[i]
        pivot_idx += 1
      # elsif array[i] <= pivot && found_big
      #   temp = array[i]
      #   array[i] = array[pivot_idx]
      #   array[pivot_idx] = temp
      #
      #   pivot_idx += 1
      #   found_big = false
      # elsif array[i] > pivot
      #   found_big = true
      p array
      end
    end

#need to get pivotIDX
    array[start], array[pivot_idx] = array[pivot_idx], array[start]

    return pivot_idx

  end

end
