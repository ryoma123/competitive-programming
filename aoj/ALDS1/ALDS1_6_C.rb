n = gets.to_i
a = n.times.map{gets.split}
a.map! {|a| {suit: a[0], value: a[1].to_i} }

b = Marshal.load(Marshal.dump(a))

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

  l[n1] = r[n2] = {value: SENTINEL}
  i = j = 0

  (left...right).each do |k|
    if l[i][:value] <= r[j][:value]
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

def partition(a, p, r)
  x = a[r]
  i = p - 1

  (p...r).each do |j|
    if a[j][:value] <= x[:value]
      i += 1
      tmp = a[i]
      a[i] = a[j]
      a[j] = tmp
    end
  end

  tmp = a[i + 1]
  a[i + 1] = a[r]
  a[r] = tmp
  return i + 1
end

def quick_sort(a, p, r)
  if p < r
    q = partition(a, p, r)
    quick_sort(a, p, q - 1)
    quick_sort(a, q + 1, r)
  end
end

merge_sort(a, 0, n)
quick_sort(b, 0, n - 1)

puts a == b ? 'Stable' : 'Not stable'
puts b.map {|b| "#{b[:suit]} #{b[:value]}" }
