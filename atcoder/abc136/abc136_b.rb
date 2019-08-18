n = gets.to_i

count = 0

for i in 1..n
  count += 1 if i.to_s.length.odd?
end
puts count
