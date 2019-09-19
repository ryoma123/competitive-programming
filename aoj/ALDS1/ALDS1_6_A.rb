N = gets.to_i
a = gets.split.map(&:to_i)

k = 10000
b = []

def counting_sort(a, b, k)
  c = Array.new(k + 1, 0)

  (0...N).each do |i|
    c[a[i]] += 1
  end

  (1..k).each do |i|
    c[i] = c[i] + c[i - 1]
  end

  (0...N).each do |j|
    b[c[a[j]]] = a[j]
    c[a[j]] -= 1
  end
  b.shift
end

counting_sort(a, b, k)
puts b.join(' ')
