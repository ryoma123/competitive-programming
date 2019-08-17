k, x = gets.split.map(&:to_i)

arr = [x]

for i in 1..k-1
  arr.concat([x + i, x - i])
end
puts arr.sort.join(' ')
