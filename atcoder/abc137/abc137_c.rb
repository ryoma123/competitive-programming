n = gets.to_i
arr = n.times.map{gets.chomp}

list = {}
count = 0

for s in arr
  k = s.split('').sort.join
  if list.has_key?(k)
    list[k] += 1
  else
    list[k] = 1
  end
end

list.each do |_, v|
  if v > 1
    count += v * (v - 1) / 2
  end
end
puts count
