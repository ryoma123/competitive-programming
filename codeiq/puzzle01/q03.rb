n = 100
a = Array.new(n){false}

(1...n).each do |i|
  (i...n).step(i + 1) do |j|
    a[j] = !a[j]
  end
end

n.times do |i|
  puts i + 1 if !a[i]
end
