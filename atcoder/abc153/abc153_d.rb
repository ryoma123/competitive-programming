n = gets.to_i

l = n
c = 0
sum = 1

if l <= 1
  puts 1
  exit
end

loop do
  l = l / 2
  c += 1

  if l <= 1
    break
  end
end

(1..c).each do |i|
  sum += 2**i
end
puts sum
