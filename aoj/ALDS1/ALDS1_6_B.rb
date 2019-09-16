n = gets.to_i
a = gets.split.map(&:to_i)

def partition(a, p, r)
  x = a[r]
  i = p - 1

  (p...r).each do |j|
    if a[j] <= x
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

q = partition(a, 0, n - 1)
a[q] = "[#{a[q]}]"
puts a.join(' ')
