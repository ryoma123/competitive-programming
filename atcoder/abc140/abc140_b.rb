n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)

sum = b.inject(:+)

for i in 0...n-1
  if a[i] == a[i+1] - 1
    sum += c[a[i]-1]
  end
end
puts sum
