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

  end

  def self.partition(array, start, length, &prc)
    pivot = array[start]
    partition = start + 1

    for i in start + 1...start + length
      if array[i] <= pivot
        temp = array[i]
        array[i] = array[partition]
        array[partition] = array[i]
        partition += 1
      end
    end

    temp = pivot
    pivot = array[partition - 1]
    array[partition - 1] = temp

    return partition-1

  end

end
