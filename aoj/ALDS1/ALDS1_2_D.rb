n = gets.to_i
a = n.times.map {gets.to_i}

$cnt = 0
$g = []

def insertion_sort(a, n, g)
  for i in g..n-1
    v = a[i]
    j = i - g

    while j >= 0 && a[j] > v
      a[j+g] = a[j]
      j = j - g

      $cnt += 1
    end
    a[j+g] = v
  end
end

def shell_sort(a, n)
  h = 1

  while h <= n
    $g.unshift(h)
    h = (3 * h) + 1
  end

  $m = $g.count

  for i in 0..$m-1
    insertion_sort(a, n, $g[i])
  end
  a
end

ss = shell_sort(a, n)
puts $m
puts $g.join(' ')
puts $cnt
puts ss
