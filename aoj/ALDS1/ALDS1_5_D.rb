n = gets.to_i
a = gets.split.map(&:to_i)

SENTINEL = 2000000000

def merge(a, left, mid, right)
  n1 = mid - left
  n2 = right - mid
  l = []
  r = []
  cnt = 0

  (0...n1).each do |i|
    l[i] = a[left + i]
  end
  (0...n2).each do |i|
    r[i] = a[mid + i]
  end

  l[n1] = r[n2] = SENTINEL
  i = j = 0

  (left...right).each do |k|
    if l[i] <= r[j]
      a[k] = l[i]
      i += 1
    else
      a[k] = r[j]
      j += 1
      cnt += n1 - i # mid + j - k - 1
    end
  end
  cnt
end

def merge_sort(a, left, right)
  if left+1 < right
    mid = (left + right) / 2
    v1 = merge_sort(a, left, mid)
    v2 = merge_sort(a, mid, right)
    v3 = merge(a, left, mid, right)
    v1 + v2 + v3
  else
    0
  end
end

puts merge_sort(a, 0, n)
