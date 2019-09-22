n = gets.to_i
a = n.times.map{gets.to_i}

m1 = a.max
b = Marshal.load(Marshal.dump(a))
b.delete_at(a.index(m1))
m2 = b.max

(0...n).each do |i|
  if a[i] == m1
    puts m2
  else
    puts m1
  end
end
