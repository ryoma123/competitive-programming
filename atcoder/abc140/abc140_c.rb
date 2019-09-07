an = gets.to_i
b = gets.split.map(&:to_i)

bn = an - 1
count = (b[0] + b[-1])

for i in 1...bn
  count += [b[i-1], b[i]].min
end
puts count
