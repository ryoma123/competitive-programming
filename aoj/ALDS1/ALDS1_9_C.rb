$a = []
$h = 0
INFTY = 1 << 30

def max_heapify(i)
  l = 2 * i
  r = 2 * i + 1

  if l <= $h && $a[l] > $a[i]
    largest = l
  else
    largest = i
  end

  if r <= $h && $a[r] > $a[largest]
    largest = r
  end

  if largest != i
    $a[i], $a[largest] = $a[largest], $a[i]
    max_heapify(largest)
  end
end

def extract()
  return -INFTY if $h < 1
  maxv = $a[1]

  $a[1] = $a[$h]
  $h -= 1

  max_heapify(1)
  maxv
end

def increase_key(i, key)
  return if key < $a[i]

  $a[i] = key
  while i > 1 && $a[i / 2] < $a[i]
    $a[i], $a[i / 2] = $a[i / 2], $a[i]
    i = i / 2
  end
end

def insert(key)
  $h += 1
  $a[$h] = -INFTY
  increase_key($h, key)
end

loop do
  a = gets.chomp.split
  break if a[0][0] == 'e' && a[0][1] == 'n'

  if a[0][0] == 'i'
    key = a[1].to_i
    insert(key)
  else
    puts extract()
  end
end
