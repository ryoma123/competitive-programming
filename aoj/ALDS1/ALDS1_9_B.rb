N = gets.to_i
$a = gets.split.map(&:to_i)
$a.unshift(nil)

def max_heapify(i)
  l = 2 * i
  r = 2 * i + 1

  if l <= N && $a[l] > $a[i]
    largest = l
  else
    largest = i
  end

  if r <= N && $a[r] > $a[largest]
    largest = r
  end

  if largest != i
    $a[i], $a[largest] = $a[largest], $a[i]
    max_heapify(largest)
  end
end

(N / 2).downto(1) do |i|
  max_heapify(i)
end

puts " #{$a.compact.join(' ')}"
