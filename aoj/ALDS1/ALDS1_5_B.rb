n = gets.to_i
a = gets.split.map(&:to_i)

SENTINEL = 2000000000
$cnt = 0

def merge(a, left, mid, right)
  n1 = mid - left
  n2 = right - mid
  l = []
  r = []

  (0...n1).each do |i|
    l[i] = a[left + i]
  end
  (0...n2).each do |i|
    r[i] = a[mid + i]
  end

  l[n1] = r[n2] = SENTINEL
  i = j = 0

  (left...right).each do |k|
    $cnt += 1

    if l[i] <= r[j]
      a[k] = l[i]
      i += 1
    else
      a[k] = r[j]
      j += 1
    end
  end
end

def merge_sort(a, left, right)
  if left+1 < right
    mid = (left + right) / 2
    merge_sort(a, left, mid)
    merge_sort(a, mid, right)
    merge(a, left, mid, right)
  end
end

merge_sort(a, 0, n)
puts a.join(' ')
puts $cnt
