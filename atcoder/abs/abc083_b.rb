n, a, b = gets.split.map(&:to_i)
sum = 0

for num in 1..n
  i = num.to_s.split('').map(&:to_i).inject(:+)
  sum += num if a <= i && i <= b
end
puts sum
