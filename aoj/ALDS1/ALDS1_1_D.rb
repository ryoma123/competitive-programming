n = gets.to_i
a = n.times.map {gets.to_i}

min = a[0]
max_diff = a[1] - a[0]

for i in 1..n-1
  diff = a[i] - min
  if max_diff < diff
    max_diff = diff
  end

  if a[i] < min
    min = a[i]
  end
end
puts max_diff
